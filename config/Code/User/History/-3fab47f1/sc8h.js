import express from 'express';
import { createServer } from 'http';
const hostname = 'localhost';
const port =3000;

const app = express();

app.use((req,res,next)=>{
    console.log(req.headers)
    res.statusCode=400;
    res.setHeader('Content-Type','text/html');
    res.end('<html><body>This is Express Server..</body></html>');

});

const server = createServer(app);
server.listen(port,hostname,()=>{
    console.log('Server create and works in http://${hostname}/${port}');
})