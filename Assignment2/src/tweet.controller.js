const mongoose = require('mongoose');

const Tweet = require('./tweet');
let dev_db_url = 'mongodb://sean:sean666@ds129625.mlab.com:29625/tweets';
let mongoDB = process.env.MONGODB_URI || dev_db_url;
mongoose.connect(mongoDB);
mongoose.Promise = global.Promise;
let db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

exports.test = function (req, res) {
    res.send('Tester!!');
};

exports.count = function (req, res) {
	const uniqueUsers = db.tweets.distinct( "user");
	res.send(uniqueUsers.length);
}