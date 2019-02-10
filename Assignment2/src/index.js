const csv = require("fast-csv");
const fs = require("fs");
const Server = require('mongodb').Server;
var Db = require('mongodb').Db;
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

console.log('Starting now');
 var mongoclient = new MongoClient(new Server("localhost", 27017), {native_parser: true});

var stream = fs.createReadStream("data.csv");
 
function csvStream() { 
	return csv
    .parse()
    .on("data", function(data){
    	
    	var db = mongoclient.db("tweets");
  if (err) throw err;
  let insObj = {polarity: data[0], id: data[1], date: data[2], query: data[3], user: data[4], text: data[5]};
  db.collection("tweets").insertOne(insObj, function(err, res) {
    if (err) throw err;
});
    })
    .on("end", function(){
         console.log("done");
    });
}
 mongoclient.open(function(err, mongoclient) {
stream.pipe(csvStream());

console.log('Data insertion complete ... ');
  });


function twitterCount() {
	return db.collection("tweets").count();
}
function twitterLinkedUsers() {
}
function mostMentionedUsers() {
}
function mostActiveUsers() {
}
function mostGrumpty() {}
function mostHappy() {}