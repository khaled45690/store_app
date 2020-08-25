data = {
    "user" : "khaled",
    "email" : "k.saad1281@gmail.com"
}

module.exports =  (db)=>{
    console.log("entered");
    db.collection("users").insertOne({ data }, (err, result) => {
console.log(err);
      });

}