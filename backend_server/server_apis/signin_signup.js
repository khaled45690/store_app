module.exports =  (req , res , db)=>{
    console.log("entered");
if (req.url === "/Signup") {
    req.on('data', function (data) {
        var body = JSON.parse(data);
        console.log(body);
        db.collection("users").findOne({ "email": body.email }, (err, result) => {
          console.log(err);
          if (err === null) {
            db.collection("users").insertOne(body, (err, respond) => {
              console.log(err);
              console.log(respond);
              let responds = { "state": "succed", "respond": "the account has been created successfully please go back and try to sign in" }
              res.end(JSON.stringify(responds));

            });

          } else {
            let responds = { "state": "failed", "respond": "your account is used before" }
            res.end(JSON.stringify(responds));
          }
        });
      });
} else if (req.url === "/Signin") {

    req.on('data', (data) => {
        var body = JSON.parse(data);
        db.collection("users").findOne({ "email": body.email, "password": body.password }, (err, result) => {
          if (result === null) {
            let respond = { "msg": "the password or email or wrong please try agan" }
            res.end(JSON.stringify(respond))
          } else {
            let respond = { "msg": "you have logged in succesfully", "result": result }
            res.end(JSON.stringify(respond))
          }

        });

      });
}

}