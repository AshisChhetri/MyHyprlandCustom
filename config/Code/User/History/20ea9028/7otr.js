const mongoose = require('mongoose')
const Schema = mongoose.Schema;

// require('mongoose-currency').loadType(mongoose);
// const currency=mongoose.Types.currency;

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
        type: String,
        required: true,
        min: 0
    }
},{
    timestamps: true
});

var Items = mongoose.model('item', itemSchema);
module.exports = Items;