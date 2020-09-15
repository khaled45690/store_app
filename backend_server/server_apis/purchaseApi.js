const DataBase_Connection = require('./DataBase_Connection');
ObjectID = require('mongodb').ObjectID,
  module.exports = (req, res) => {
    db = DataBase_Connection.db;
    req.on('data', function (data) {
      var body = JSON.parse(data);
      let profite = 0;
      Promise.all(Object(body).map((MapData, index) => {
        return new Promise((resolve)=>{
          const product = MapData.product;
          const quantity = MapData.quantity;
          const totalPriceForTheItem = MapData.totalPriceForTheItem;
          // updating the quantity section --------------------------------------->
          db.collection("products").findOne({ "_id": ObjectID(product._id) }, (err, result) => {
            product.quantity = result.quantity - quantity;
          let newquantity = {"quantity" : product.quantity}
            db.collection("products").updateOne({ "_id": ObjectID(product._id)} , {$set : newquantity}, (err, result) => {
            });
            profite += totalPriceForTheItem;
            resolve(totalPriceForTheItem);
  
          });
        })
      })).then((data)=>{
        
                    // updating the profite for Admins section --------------------------------------->

            db.collection("users").find({ "isAdmin": true }).toArray((err, result) => {
              Object(result).map((MapData, index) => {
                if (MapData.profite === undefined) {
                  MapData.profite = profite;
                  db.collection("users").updateOne({ "_id": ObjectID(MapData._id)}, {$set: MapData } , (err, result) => {
                  });
                } else {
                  MapData.profite =  MapData.profite + profite;
                  db.collection("users").updateOne({ "_id": ObjectID(MapData._id)}, {$set: MapData } , (err, result) => {
                  });
                }
              });
            });
      })





      res.end(JSON.stringify("done"));
    });
  }