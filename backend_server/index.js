const express = require('express');
const path = require('path');
const cors = require('cors');
const registration = require('./server_apis/signin_signout')
const mongoose = require('mongoose');
const url = "mongodb+srv://doubleThumb:<doubleThumb>@cluster0.x2fv6.mongodb.net/<dbname>?retryWrites=true&w=majority";
mongoose.connect(url, {useNewUrlParser: true, useUnifiedTopology: true} , ()=>{
    console.log("database is connected");
});
// set up express app
const app = express();
app.use(cors());
app.use('/' ,express.static(path.normalize(__dirname + '/build')));
app.use('/', (req , res) => {
    console.log(req.url);
    registration(req , res);

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