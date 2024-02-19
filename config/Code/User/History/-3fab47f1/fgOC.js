const express = require('express');
const http = require('http');
const hostname = 'localhost';
const port =3000;

const app = express();

app.use((req,res,next)=>{
    console.log('')
    res.statusCode=400;
    res.setHeader('Content-Type','text/html');
    res.end('<html><body>This is Express Server..</body></html>');

});

const server = http.createServer(app);
server.listen(port,hostname,()=>{
    console.log('Server create and works in http://${hostname}/${port}');
})