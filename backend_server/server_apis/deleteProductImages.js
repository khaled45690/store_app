const fs = require('fs');
const path = require('path');
module.exports =  (req,res)=>{  
    req.on('data', function (data) {
        var body = JSON.parse(data);
        fs.unlink(path.normalize(__dirname + '/../productImage/'+ body) , (err)=>{
            res.end();
        });
      });
      
  }