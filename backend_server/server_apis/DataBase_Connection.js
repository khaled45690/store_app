
const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://khaled45680:333@cluster0.kmee3.gcp.mongodb.net/<dbname>?retryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
let db;
client.connect(err => {
    if(err === null){
    console.log("u r connected to the database");
    db = client.db("storeApp"); 
    module.exports.db = db ;
    }else{
        console.log("call khaled immediatly");
    }
    console.log(err);

});

