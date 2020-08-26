var IncomingForm = require('formidable').IncomingForm
inspect = require('util').inspect;
var Busboy = require('busboy');

var form = new IncomingForm()
form.uploadDir = 'uploads'
module.exports =  (req,res)=>{
    console.log(req.files);

            var busboy = new Busboy({ headers: req.headers });
            busboy.on('file', function(fieldname, file, filename, encoding, mimetype) {
              console.log('File [' + fieldname + ']: filename: ' + filename + ', encoding: ' + encoding + ', mimetype: ' + mimetype);
              file.on('data', function(data) {
                console.log('File [' + fieldname + '] got ' + data.length + ' bytes');
              });
              file.on('end', function() {
                console.log('File [' + fieldname + '] Finished');
              });
            });
            busboy.on('field', function(fieldname, val, fieldnameTruncated, valTruncated, encoding, mimetype) {
              console.log('Field [' + fieldname + ']: value: ' + inspect(val));
            });
            busboy.on('finish', function() {
              console.log('Done parsing form!');
              res.writeHead(303, { Connection: 'close', Location: '/' });
              res.end();
            });
            req.pipe(busboy);
  
}