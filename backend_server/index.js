const express = require('express');
const path = require('path');
const cors = require('cors');
const registration = require('./server_apis/signin_signup');
let db;
const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://doubleThumb:<doubleThumb>@cluster0.x2fv6.mongodb.net/<dbname>?retryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
client.connect(err => {
 console.log("u r connected to the database");
  db = client.db("Data");
  //   client.close();
});
// set up express app
const app = express();
app.use(cors());
// app.use('/' ,express.static(path.normalize(__dirname + '/build')));
app.use('/api', (req , res) => {
    console.log(req.url);
    registration(req , res , db);

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