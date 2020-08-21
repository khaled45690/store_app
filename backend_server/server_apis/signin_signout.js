const mongoose = require('mongoose');
const UserInfoSchema = new mongoose.Schema({ email: 'string', password: 'string' });
const UserInfo = mongoose.model("UserInfo" , UserInfoSchema)
User = {
    "email" : "k.saad1281@gmail.com",
    "password" : "123"
}

module.exports = (req , res)=>{
    console.log("entered");
if (req.url === "/Signup") {
    
    UserInfo.findOne({ "email": User.email, "password": User.password }, (err, result) => {
            console.log(result);
        if (result === null) {
            UserInfo.insertMany(User , (results)=>{
                console.log(results);
                res.end(JSON.stringify(results));
            })
          
        } else {
          let respond = { "msg": "you have logged in succesfully", "result": result }
          res.end(JSON.stringify(respond))
        }

      })
    // req.on('data', (data) => {
    //     const body = JSON.parse(data);
    //   })
    UserInfo.findOne()
} else {
    
}
}