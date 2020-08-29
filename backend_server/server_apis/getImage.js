const fs = require('fs')
const byline = require('byline')
module.exports =  (req,res)=>{  
    req.url.substring(10);
    console.log(req.url.substring(10));
    let stream = fs.createReadStream('./images/'+req.url.substring(10));
    stream = byline.createStream(stream);
    stream.pipe(res);
    stream.on('end', res.end);
  }