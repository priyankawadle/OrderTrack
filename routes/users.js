var jwt = require('jsonwebtoken');

const bcrypt = require('bcrypt');
const saltRounds = 10;


exports.signup=function(req , res){
    var username  = req.body.username;
    var pass= req.body.password;
    var email=req.body.email;
    var typeof_user=req.body.typeof_user;

    bcrypt.genSalt(saltRounds, function(err, salt) {
        bcrypt.hash(pass, salt, function(err, hash) {

    var sql = "INSERT INTO `users`(`username`,`email`,`password`,`typeof_user`) VALUES ('" + username + "','" +email+ "','" +hash+ "','" +typeof_user+"')";
         var query = db.query(sql, function(err, result){
             if(err){
                console.log("mysql error is",err)
             }else{
                console.log("result is",result)
                res.end(JSON.stringify(result));
             }
   });
});
});

};

exports.signin=function(req , res){
var name=req.body.email;
var pass= req.body.password;
bcrypt.genSalt(saltRounds, function(err, salt) {
    bcrypt.hash(pass, salt, function(err, hash) {
  

var sql="SELECT id, first_name, last_name, email FROM `users` WHERE `email`='"+name+"' AND `password`="+hash+"'  ";

db.query(sql, function(err, results){    
    
    if(results != ""){
        
        
        var data = JSON.stringify(results);
        
        var secret = 'TOPSECRETTTTT';
           var now = Math.floor(Date.now() / 1000),
               iat = (now - 10),
               expiresIn = 3600,
               expr = (now + expiresIn),
               notBefore = (now - 10),
               jwtId = Math.random().toString(36).substring(7);
           var payload = {
               iat: iat,
               jwtid : jwtId,
               audience : 'TEST',
               data : data
           };    
           
        
        jwt.sign(payload, secret, { algorithm: 'HS256', expiresIn : expiresIn}, function(err, token) {
               
           if(err){
               console.log('Error occurred while generating token');
               console.log(err);
               return false;
           }
            else{
           if(token != false){
               //res.send(token);
               res.header();
               res.json({
                     "results":
                             {"status": "true"},
                     "token" : token,
                   "data" : results
                                   
                 });
               res.end();
           }
           else{
               res.send("Could not create token");
               res.end();
           }
           
            }
       });
   
    }
    else if(results == ""){
            console.log("not a user");
    }
    else if(err){
        console.log("mysql error is",err,name,encrypted_pass)
    }
});
});
});
};

exports.getuser=function(req , res){
    var sql = `SELECT id,username,email,typeof_user,created_at FROM users WHERE typeof_user='seller'`;
    var query = db.query(sql, function(err, result){
        if(err){
           console.log("mysql error is",err)
        }else{
           console.log("result is",result)
           res.end(JSON.stringify(result));
        }
});
}

exports.getsellers_catlogs=function(req , res){
   console.log("rrrrr",req.params.seller_id)



    var sql = `SELECT *FROM catalogs WHERE seller_id='${req.params.seller_id}'`;
    var query = db.query(sql, function(err, result){
        if(err){
           console.log("mysql error is",err)
        }else{
           console.log("result is",result)
           res.end(JSON.stringify(result));
        }
});
}

exports.create_order=function(req , res){

    var sql = `INSERT INTO product_order(product_id, amount, user_id, seller_id) VALUES('${req.body.product_id}','${req.body.amount}','${req.body.user_id}','${req.body.seller_id}')`;
    var query = db.query(sql, function(err, result){
        if(err){
           console.log("mysql error is",err)
        }else{
           console.log("result is",result)
           res.end(JSON.stringify(result));
        }
});

 }


 exports.create_catalog=function(req , res){
    db.query(`select typeof_user from users as a where a.id='${req.body.seller_id}'`, function(err, result){
      if(err){
         console.log("mysql error is",err)
         res.status(500).send({ auth: false, message:err });
      }else{
         console.log("result is",result[0].typeof_user)
         if(result[0].typeof_user=='seller'){
            var sql = `INSERT INTO catalogs(name, seller_id) VALUES('${req.body.name}','${req.body.seller_id}')`;
            var query = db.query(sql, function(err, result){
                if(err){
                   console.log("mysql error is",err)
                   res.status(500).send({ auth: false, message:err });
                }else{
                   console.log("result is",result)
                   res.end(JSON.stringify(result));
                }
         });
         }else{
            res.status(500).send({ auth: false, message:"user is not seller ,can't create catalogs" });
         }
      }
});
 }

 
 exports.getorders=function(req , res){

    var sql = `select * from product_order`;
    var query = db.query(sql, function(err, result){
        if(err){
           console.log("mysql error is",err)
           res.end(err);
        }else{
           console.log("result is",result)
           res.end(JSON.stringify(result));
        }
});

 }

 exports.getorders_singleseller=function(req , res){


   var sql = `select * from product_order as a where a.seller_id=${req.params.seller_id} `;
   var query = db.query(sql, function(err, result){
       if(err){
          console.log("mysql error is",err)
          res.end(err);
       }else{
          console.log("result is",result)
          res.end(JSON.stringify(result));
       }
});

}
