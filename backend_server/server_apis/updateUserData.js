const DataBase_Connection = require('./DataBase_Connection');
ObjectID = require('mongodb').ObjectID,
module.exports =  (req , res)=>{
      db = DataBase_Connection.db;
        req.on('data', function (data) {
            var body = JSON.parse(data);
            var profileImage = {"profileImage" : body.profileImage}
            console.log(profileImage);
            console.log(body);
            db.collection("users").updateOne({ "_id": ObjectID(body._id)},{$set:profileImage },(err, result) => {
                console.log(err);
                console.log(result);
                res.end();
            });
           
          });
        }
