const express = require('express');
const bodyParser = require('body-parser');
const csv = require("fast-csv");
const fs = require("fs");
const Server = require('mongodb').Server;
var Db = require('mongodb').Db;
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";
const tweet = require('./router');

console.log('Starting now');
 // var mongoclient = new MongoClient(new Server("localhost", 27017), {native_parser: true});
const app = express();
let port = 1234;

app.use('/tweets', tweet);
app.listen(port, () => {
    console.log('Server is up and running on port number ' + port);
});

var stream = fs.createReadStream("data.csv");
 
function csvStream() { 
	return csv
    .parse()
    .on("data", function(data){
  let insObj = {polarity: data[0], id: data[1], date: data[2], query: data[3], user: data[4], text: data[5]};
    })
    .on("end", function(){
         console.log("done");
    });
}
stream.pipe(csvStream());

console.log('Data insertion complete ... ');

// function twitterCount() {
// 	const uniqueUsers = db.tweets.distinct( "user" );
// 	return uniqueUsers.length;
// }
// function twitterLinkedUsers() {
// }
// function mostMentionedUsers() {
// 	db.tweets.aggregate([ 
//     {$project:{ AccountName: "$user", count: {$size:{"$ifNull":["$text",[]]} } }}, 
//     {$sort : {count : -1}}, 
//     {$limit : 10 }
// ])

// }
// function mostActiveUsers() {
// 	db.tweets.aggregate([ 
//     {$project:{ AccountName: "$user", count: {$size:{"$ifNull":["$text",[]]} } }}, 
//     {$sort : {count : -1}}, 
//     {$limit : 10 }
// }
// function mostGrumpy() {
// 	db.tweets.aggregate([ 
//     {$Grumpiest:{ AccountName: "$user", count: {$size:{"$ifNull":["$text",[]]} } }}, 
//     {$sort : {count : -1}}, 
//     {$limit : 10 }
// }
// function mostHappy() {}