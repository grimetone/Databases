const fs = require('fs');
const crypto = require('crypto');

const file = 'db.txt';
// Set up write stream
const writeStream = fs.createWriteStream('db.txt');

/**
 * Set up DB class
 */
class DB {
  constructor() {
    this.list = file.getAsText();
  }
// Gets the input keys value
  getValue(x) {
    let res;
    this.list.forEach(data => {
      if (data[0] === x) {
        res = data[1]
      }
    })
    if (res) return res;
  }
// Sets the data
  setData(x, y) {
  	let buffer;
    this.list.push([x, y])
    //Create buffer
    buffer = Buffer.from([x, y]);
    writeStream.write([x, y]);
  }
}

/**
 * Create new DB object
 * @type {DB}
 */
let database = new DB();

database.setData('a', 1)
console.log(database.getValue('a')) // 1
console.log(database.getValue('I_DONT_EXIST')) // undefined

// create another Buffer of 100 bytes and write
writeStream.write('hello');


writeStream.end();
