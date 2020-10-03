const fs = require('fs');
const path = require('path');
var cloudinary = require('cloudinary').v2;

cloudinary.config({ 
  cloud_name: 'dohsjyvur', 
  api_key: '471713839541679', 
  api_secret: 'ucT1nVOkAg6KV_V2cf8PCDIrseM' 
});
module.exports =  (req,res)=>{  
    req.on('data', function (data) {
        var body = JSON.parse(data);
        cloudinary.uploader.destroy(body.imageName, function(result) { console.log(result) });
        res.end("done");
      });
      
  }