const fs = require('fs');
const path = require('path');
module.exports =  (req,res)=>{  
  url = __dirname + '/../images/'+req.url.substring(10);
  console.log(path.normalize(url));
  if (req.url.split('.').pop() === 'png') {
    res.writeHead(200, { 'Content-Type': 'image/png' });
    var RS = fs.createReadStream(path.normalize(url));
    RS.pipe(res);
}
if (req.url.split('.').pop() === 'jpg') {
    res.writeHead(200, { 'Content-Type': 'image/jpg' });
    var RS = fs.createReadStream(path.normalize(url));
    RS.pipe(res);
}

  }