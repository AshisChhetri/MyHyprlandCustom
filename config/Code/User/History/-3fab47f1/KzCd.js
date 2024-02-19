import express from 'express';
import { createServer } from 'http';
import { morgan } from 'morgan';
const hostname = 'localhost';
const port =3000;

const app = express();
app.use(morgan('dev'));

app.use(express.static(__dirname+'/public'));

app.use((req,res,next)=>{
    res.statusCode=400;
    res.setHeader('Content-Type','text/html');
    res.end('<html><body>This is Express Server..</body></html>');

});

const server = createServer(app);
server.listen(port,hostname,()=>{
    console.log('Server create and works in http://${hostname}/${port}');
})