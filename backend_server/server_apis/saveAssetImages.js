const fs = require('fs');
const path = require('path');
const Busboy = require('busboy');
ObjectID = require('mongodb').ObjectID,

module.exports = (req,res)=>{  
  let name = "productImage" + ObjectID() + ".jpg";
  var busboy = new Busboy({ headers: req.headers });
  busboy.on('file', function(fieldname, file, filename, encoding, mimetype ) {

    var saveTo = path.normalize(__dirname + "/../productImage/" + name);
    file.pipe(fs.createWriteStream(saveTo));
  });
  busboy.on('finish', function() {
    res.end(JSON.stringify(name));
  });
  req.pipe(busboy);
  
}