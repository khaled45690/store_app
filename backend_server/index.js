const express = require('express');
const path = require('path');
const cors = require('cors');
const registration = require('./server_apis/signin_signup');
const Save_Image = require('./server_apis/Save_Image');
const getImage = require('./server_apis/getImage');

// set up express app
const app = express();
app.use(cors());

// app.use('/' ,express.static(path.normalize(__dirname + '/build')));

app.use('/api', (req , res) => {
    console.log(req.url);
    if (req.url === "/Signup" || req.url === "/Signin" ) {
        registration(req , res);
     }
     else if (req.url === "/SaveImage") {
        Save_Image(req , res);
    }else if (req.url.substring(0,9) == "/getImage") {
        getImage(req , res);
    }
    
});

// listen to the local server
app.listen(process.env.PORT || 3001, () => {
    console.log("you are connected to the Server");
});