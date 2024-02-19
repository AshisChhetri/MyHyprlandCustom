
const express = require('express')  
const bodyParser = require('body-parser');  

const Items = require('../models/items');

const checkInRouter = express.Router();
checkInRouter.use(bodyParser.json());

checkInRouter.route('/')