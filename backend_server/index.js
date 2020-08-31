const express = require('express');
const path = require('path');
const cors = require('cors');
const registration = require('./server_apis/signin_signup');
const Save_Image = require('./server_apis/Save_Image');
const getImage = require('./server_apis/getImage');
const deleteImage = require('./server_apis/delete_Image');
const updateUserData = require('./server_apis/updateUserData');
const uploadAssetImages = require('./server_apis/saveAssetImages');
const addProduct = require('./server_apis/addProduct');

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
    }else if (req.url === "/deleteImage"){
        deleteImage(req , res);
    }else if (req.url === "/updateUserData"){
        updateUserData(req , res);
    }else if (req.url === "/uploadAssetImages"){
        uploadAssetImages(req , res);
    }else if (req.url === "/addProduct"){
        addProduct(req , res);
    }
    
});

// listen to the local server
app.listen(process.env.PORT || 3001, () => {
    console.log("you are connected to the Server");
});