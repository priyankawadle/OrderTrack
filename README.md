# OrderTrack
i uploaded all files which are required for execution of project 
if you want run this project follow below instructions
1. clone this folder using 
git clone https://github.com/priyankawadle/OrderTrack.git
2.import database dump file through workbench 
click on server button and data import and upload dump file of db
3.import postman collection file (sample_endpoints_api.postman_collection) on postman 
4.after importing db,modify config.js file in which alter following variables
 host: '',
    user: '',
    password: '',
    database : ''
5.after that run following command to install all packages with same version
npm install
6.run following command
node app
7.hit signup api endpoint give particular body 
8.then sign in using email and password which where used while signup
9.it will give you token after successfull hit
10.provide this token in header of each api before hitting it and execute api with proper body or params.



