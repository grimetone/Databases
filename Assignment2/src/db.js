var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/mydb";

/**
 * Creates Mongo DB
 */
 function db() {
   MongoClient.connect(url, function(err, db) {
  if (err) throw err;
  var dbo = db.db("mydb");
  dbo.createCollection("tweets", function(err, res) {
    if (err) throw err;
    console.log("Collection created!");
  });
  return db;
});
 }

module.exports = db;