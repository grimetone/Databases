const express = require('express');
const bodyParser = require('body-parser');
const csv = require("fast-csv");
const fs = require("fs");
const Server = require('mongodb').Server;
var Db = require('mongodb').Db;
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";
const tweet = require('./router');
const mongoose = require('mongoose');

console.log('Starting now');
 // var mongoclient = new MongoClient(new Server("localhost", 27017), {native_parser: true});
const app = express();
let port = 1234;

app.use('/tweets', tweet);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.listen(port, () => {
    console.log('Server is up and running on port number ' + port);
});

let dev_db_url = 'mongodb://sean:sean666@ds129625.mlab.com:29625/tweets';
let mongoDB = process.env.MONGODB_URI || dev_db_url;
mongoose.connect(mongoDB);
mongoose.Promise = global.Promise;
let db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

var stream = fs.createReadStream("data.csv");
 
function csvStream() { 
	return csv
    .parse()
    .on("data", function(data){
  let insObj = {polarity: data[0], id: data[1], date: data[2], query: data[3], user: data[4], text: data[5]};
  // db.collection('tweets').insert(insObj);
    })
    .on("end", function(){
         console.log("done");
    });
}
stream.pipe(csvStream());

console.log('Data insertion complete ... ');