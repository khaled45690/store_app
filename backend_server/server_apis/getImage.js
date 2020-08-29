const fs = require('fs')
module.exports =  (req,res)=>{  
  if (req.url.split('.').pop() === 'png') {
    res.writeHead(200, { 'Content-Type': 'image/png' });
    var RS = fs.createReadStream(__dirname + '../images/'+req.url.substring(10));
    RS.pipe(res);
}
if (req.url.split('.').pop() === 'jpg') {
    res.writeHead(200, { 'Content-Type': 'image/jpg' });
    var RS = fs.createReadStream(__dirname + '../images/'+req.url.substring(10));
    RS.pipe(res);
}

  }