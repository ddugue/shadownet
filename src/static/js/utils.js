const md5 = require('blueimp-md5');

// Return the date
function getDate(year0) {
}

// Return an HEX UUID
function hexUUID() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x1000)
      .toString(16)
  }
  return s4() + s4() + s4() + s4();
}

// Return an md5 checksum of an object
function tomd5(obj) {
  return md5(JSON.stringify(obj));
}

module.exports = {
  tomd5: tomd5,
  hexUUID: hexUUID,
}
