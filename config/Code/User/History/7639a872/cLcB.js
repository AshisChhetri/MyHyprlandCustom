
const express = require('express')  
const bodyParser = require('body-parser');  

const Items = require('../models/items');

const checkInRouter = express.Router();
checkInRouter.use(bodyParser.json());

checkInRouter.route('/')
.get( (req,res,next) => {
    Items.find({})
    .then((items) => {
        res.statusCode = 200;
        res.setHeader('Content-Type', 'application/json');
        res.json(items);
    }, (err) => next(err))
    .catch((err) => next(err));
})
.post((req, res, next) => {
    Items.create(req.body)
    .then((item) => {
        console.log('Dish Created ', item);
        res.statusCode = 200;
        res.setHeader('Content-Type', 'application/json');
        res.json(item);
    }, (err) => next(err))
    .catch((err) => next(err));
})
.put((req, res, next) => {
    res.statusCode = 403;
    res.end('PUT operation not supported on /items');
})
.delete( (req, res, next) => {
    Items.remove({})
    .then((resp) => {
        res.statusCode = 200;
        res.setHeader('Content-Type', 'application/json');
        res.json(resp);
    }, (err) => next(err))
    .catch((err) => next(err));    
});

module.exports = checkInRouter;