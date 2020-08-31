const DataBase_Connection = require('./DataBase_Connection');
module.exports = (req,res)=>{  
db = DataBase_Connection.db;
req.on('data', function (data) {
    var body = JSON.parse(data);
    
    db.collection("products").insertOne(body, (err, result) => {
      if (result === null) {
        let responds = { "state": "failed", "respond": "data didn't save at the server" }
        res.end(JSON.stringify(responds));
      } else {
        res.end(JSON.stringify({"msg":"data saved in DB"}));
      }
    });
  });
}