const mongooose = require('mongoose')
const Schema = mongooose.Schema;

require('mongoose-currency').loadType(mongooose);
const currency=mongooose.Types.currency; 