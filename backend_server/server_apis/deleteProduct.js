const DataBase_Connection = require('./DataBase_Connection');
ObjectID = require('mongodb').ObjectID,
module.exports =  (req , res)=>{

  db = DataBase_Connection.db;
    req.on('data', function (data) {
        var body = JSON.parse(data);
        db.collection("products").deleteOne({"_id": ObjectID(body._id)} ,(err, result) => {
          res.end();
      });
      });

}