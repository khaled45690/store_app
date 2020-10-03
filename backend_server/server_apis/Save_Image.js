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

module.exports =  (req,res)=>{  
  let name;
  var busboy = new Busboy({ headers: req.headers });
  busboy.on('file', function(fieldname, file, filename, encoding, mimetype ) {
    name = filename;
    let upload = cloudinary.uploader.upload_stream({public_id : name , folder : "ProfilePic"} , (err , result)=>{
      console.log(err , result); 
      res.end(JSON.stringify(result));
    })

    file.pipe(upload);
  });
  req.pipe(busboy);
  
}