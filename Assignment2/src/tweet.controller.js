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
exports.tweet = function (req, res, next) {
	Tweet.findById(req.params.id, function (err, data) {
        if (err) return next(err);
        res.send(data);
    })
}
exports.count = function (req, res) {
	Tweet.find().distinct('user', function (err, users) { 
     if (err) {
          res.send(err);
     } else {
     	const uniqueUsers = users.length;
          res.send(`${uniqueUsers}`);
     }
});
}

exports.linked = function (req, res) {
  Tweet.aggregate([
  {'$match':{'text':{'$regex':/@\w+/}}}, {'$addFields': {"linked":1}},{'$group':{"_id":"$user", "linked":{'$sum':1}}}, {'$sort':{"linked":-1}}, ])
  .limit(10).exec(function(err, users){
    if (err) {
      res.send(err);
    } else {
      res.send(users);
    }
  })}

// exports.active = function (req, res) {
// 	Tweet.aggregate([
//   { $match: { "price": 2000 } }
// ], function (err, users) {
//     	if (err) {
//     		res.send(err);
//     	}
//     	else {
//     		res.send(users);
//     	}
//     });
// }

// exports.grumpiest = function (req, res) {
// 	Tweet.aggregate([ 
//     {$project:{ AccountName: "$user", count: {$polarity:0} }}, 
//     {$sort : {count : -1}}, 
//     {$limit : 10 } )]
// }
// exports.happiest = function (req, res) {
// 	Tweet.aggregate([ 
//     {$project:{ AccountName: "$user", count: {$size:{"$ifNull":["$text",[]]} } }}, 
//     {$sort : {count : -1}}, 
//     {$limit : 10 })]
// }

