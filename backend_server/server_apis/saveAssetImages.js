const fs = require('fs');
const path = require('path');
const Busboy = require('busboy');
var cloudinary = require('cloudinary').v2
ObjectID = require('mongodb').ObjectID,

cloudinary.config({ 
  cloud_name: 'dohsjyvur', 
  api_key: '471713839541679', 
  api_secret: 'ucT1nVOkAg6KV_V2cf8PCDIrseM' 
});
module.exports = (req,res)=>{  
  let name = "productImage" + ObjectID();
  var busboy = new Busboy({ headers: req.headers });
  busboy.on('file', function(fieldname, file, filename, encoding, mimetype ) {
    let upload = cloudinary.uploader.upload_stream({public_id : name , folder : "ProductPic"} , (err , result)=>{
      let data = {"imageName" : result.public_id , "url" :result.url}
      console.log(data);
      res.end(JSON.stringify(data));
    })
    file.pipe(upload);
  });
  req.pipe(busboy);
  
}