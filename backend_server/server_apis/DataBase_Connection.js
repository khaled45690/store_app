let db;
const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://khaledsaad:1111111111@cluster0-p8cto.mongodb.net/<dbname>?retryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
client.connect(err => {
    if(err === null){
    console.log("u r connected to the database");
  db = client.db("storeApp"); 
    }else{
        console.log("call khaled immediatly");
    }
    console.log(err);

});

module.exports = db;