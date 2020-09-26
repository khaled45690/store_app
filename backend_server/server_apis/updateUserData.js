const DataBase_Connection = require('./DataBase_Connection');
ObjectID = require('mongodb').ObjectID,
module.exports =  (req , res)=>{
      db = DataBase_Connection.db;
        req.on('data', function (data) {
            var body = JSON.parse(data);
            var profileImage = {"profileImage" : body.profileImage}
            db.collection("users").updateOne({ "_id": ObjectID(body._id)},{$set:profileImage },(err, result) => {
                res.end();
            });
           
          });
        }
