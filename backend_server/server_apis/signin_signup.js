const DataBase_Connection = require('./DataBase_Connection');
module.exports =  (req , res)=>{
if (req.url === "/Signup") {
  db = DataBase_Connection.db;
    req.on('data', function (data) {
        var body = JSON.parse(data);
        console.log(body.email);
        db.collection("users").findOne({ "email": body.email}, (err, result) => {

          if (result === null) {
            db.collection("users").insertOne(body, (err, respond) => {
              console.log(respond.ops);
              res.end(JSON.stringify(body));

            });

          } else {
            let responds = { "state": "failed", "respond": "your account is used before" }
            res.end(JSON.stringify(responds));
          }
        });
      });
} else if (req.url === "/Signin") {
  db = DataBase_Connection.db;
    req.on('data', (data) => {
        var body = JSON.parse(data);
        db.collection("users").findOne({ "email": body.email, "password": body.password }, (err, result) => {
         
         console.log(result === null);
          if (result === null) {
            let respond = { "msg": "the password or email or wrong please try agan" }
            res.end(JSON.stringify(respond))
          } else {
            console.log("send data");
            res.end(JSON.stringify(result))
          }

        });

      });
}

}