const mongoose = require('mongoose');
const Schema = mongoose.Schema;

let TweetSchema = new Schema({
    polarity: {type: Number, required: true, max: 100},
    id: {type: Number, required: true},
    date: {type: Date},
    query: {type: String},
    user: {type: String},
    text: {type: String}
});

module.exports = mongoose.model('Tweet', TweetSchema)