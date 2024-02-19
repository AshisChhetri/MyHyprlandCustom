const mongooose = require('mongoose')
const Schema = mongooose.Schema;

require('mongoose-currency').loadType(mongooose);
const currency=mongooose.Types.currency;

const itemSchema = new Schema({
    name: {
        type: String,
        required: true,
        unique: true
        },
        des:{
        type: String,
        required: true
        },
        price:{
        type: currency,
        required: true,
        min: 0
        }
    },{
        timestamps: true
    }
);