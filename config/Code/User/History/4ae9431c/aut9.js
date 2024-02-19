const express = require('express')
const bodyParser = require('body-parser');

const checkInRouter = express.Router();
checkInRouter.use(bodyParser.json());
