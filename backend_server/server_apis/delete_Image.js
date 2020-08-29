const fs = require('fs');
const path = require('path');
module.exports =  (req,res)=>{  
    req.on('data', function (data) {
        var body = JSON.parse(data);
        console.log(body.imageName);

        console.log(path.normalize(__dirname + '/../images/'+ body.imageName));
      });

  }