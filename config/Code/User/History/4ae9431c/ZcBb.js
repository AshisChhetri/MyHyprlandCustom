
const express = require('express')  
const bodyParser = require('body-parser');  

const Items = require('../models/items');

const checkInRouter = express.Router();
checkInRouter.use(bodyParser.json());

checkInRouter.route('/')
.get(cors.cors, (req,res,next) => {
    Items.find({})
    .then((items) => {
        res.statusCode = 200;
        res.setHeader('Content-Type', 'application/json');
        res.json(items);
    }, (err) => next(err))
    .catch((err) => next(err));
})