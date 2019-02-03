const fs = require('fs');
const crypto = require('crypto');
const util = require('util');

// Storage location
const file = 'db.txt';
// Set up write stream
const writeStream = fs.createWriteStream(file);
const reader = fs.readFile(file);
const readUtil = util.promisify(fs.readFile);

/**
 * Set up DB class
 */
async function readFile(file) {
  const fileContent = await readUtil(file, 'utf8');
  console.log('content: '+fileContent);
  return fileContent;
}

async function convertBinary(file){
  const content = await readFile(file);
  const convertedContent = content.toString();
  console.log('Converted content: '+ convertedContent);
  return convertedContent;
}

class DB {
  constructor() {
    this.list = convertBinary(file);
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
    //this.list.push([x, y])
    //Create buffer
    buffer = Buffer.from([x, y]);
    writeStream.write(buffer);
  }
}

/**
 * Create new DB object
 * @type {DB}
 */
let database = new DB();


database.setData('test', 1);
writeStream.end();

