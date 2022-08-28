/**
 * Module dependencies.
 */
 require('./.env')
 var config=require('./config.js')
 var express = require('express') 
   , user = require('./routes/users')
   , http = require('http')
   , path = require('path');
 var cors = require('cors');
 var app = express();
 var bodyParser=require("body-parser");
 var jwt = require('jsonwebtoken');
 var mysql    = require('mysql2');
 var connection = mysql.createConnection({
         host: config.db.host,
         user: config.db.user,
         password: config.db.password,
         database : config.db.database,
         port: config.db.port
     });
 
 
 connection.connect(function(err) {
   if(err)
     console.log("eror is",err);
   else{
    console.log("connected successfull");
   }
 });
 
 global.db = connection;
 
 // all environments
 app.set('port',5000);
 app.set('views', __dirname + '/views');
 app.use(express.static(path.join(__dirname, 'public')));
 app.use(bodyParser.urlencoded({ extended: false }));
 app.use(bodyParser.json());
 
 app.use(function(req, res, next) {
       res.header("Access-Control-Allow-Origin", "*");
       res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
       next();
 });
 var VerifyToken = require('./VerifyToken');

 app.post('/api/auth/register', user.signup);
 app.post('/api/auth/login', user.signin);
 app.get('/api/buyer/list-of-sellers',VerifyToken,user.getuser)
app.get(`/api/buyer/seller-catalog/:seller_id`,VerifyToken,user.getsellers_catlogs)
app.post('/api/buyer/create-order',VerifyToken,user.create_order)
app.post('/api/seller/create-catalog',VerifyToken,user.create_catalog)
app.get('/api/seller/orders',VerifyToken,user.getorders)
app.get('/api/seller/orders/:seller_id',VerifyToken,user.getorders_singleseller)

 http.createServer(app).listen(app.get('port'), function(){
   console.log('Express server listening on port ' + app.get('port'));
 });