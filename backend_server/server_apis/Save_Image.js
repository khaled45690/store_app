const fs = require('fs');
const path = require('path');
const Busboy = require('busboy');
var cloudinary = require('cloudinary').v2

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
    var saveTo = path.join(__dirname + "/../images/" ,filename);
    console.log(file);

    cloudinary.uploader.upload_stream(file, 
    { public_id: name }, 
    function(error, result) {console.log(result, error); });


    file.pipe(fs.createWriteStream(saveTo));
  });
  busboy.on('finish', function() {
    res.end(JSON.stringify(name));
  });
  req.pipe(busboy);
  
}