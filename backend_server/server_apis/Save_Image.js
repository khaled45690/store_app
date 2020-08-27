const fs = require('fs');
const path = require('path');
const Busboy = require('busboy');

module.exports =  (req,res)=>{  
  let name;
  var busboy = new Busboy({ headers: req.headers });
  busboy.on('file', function(fieldname, file, filename, encoding, mimetype ) {
    name = filename;
    var saveTo = path.join(__dirname + "/../images/",filename);
    console.log(mimetype);
    file.pipe(fs.createWriteStream(saveTo));
  });
  busboy.on('finish', function() {
    res.end(JSON.stringify(name));
  });
  req.pipe(busboy);
  
}