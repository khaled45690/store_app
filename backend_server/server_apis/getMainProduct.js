const DataBase_Connection = require('./DataBase_Connection');
module.exports = (req,res)=>{ 
db = DataBase_Connection.db;
db.collection("products").find({}).toArray((err, result)=>{
    console.log(JSON.stringify(result));
    res.end(JSON.stringify(result));
})
}