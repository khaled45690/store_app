const express = require('express');
const path = require('path');
const cors = require('cors');
var multer  = require('multer')
var upload = multer({ dest: 'uploads/' })
const registration = require('./server_apis/signin_signup');
const db = require('./server_apis/DataBase_Connection');
const Save_Image = require('./server_apis/Save_Image');

// set up express app
const app = express();
app.use(cors());

// app.use('/' ,express.static(path.normalize(__dirname + '/build')));

app.use('/api', (req , res) => {
    console.log(req.url);
    if (req.url === "/Signup" || req.url === "/Signin" ) {
        registration(req , res , db);
     }
     else if (req.url === "/SaveImage") {
        Save_Image(req , res);
    } 
    
});

// listen to the local server
app.listen(process.env.PORT || 3001, () => {
    console.log("you are connected to the Server");
    // console.log("please wait will starting the server");
    // setTimeout(() => {
    //    console.log("connecting to server ------>");
    // }, 2000);
    // setTimeout(() => {
    //     console.log("you are connected to the Server");
    //  }, 5000);
});