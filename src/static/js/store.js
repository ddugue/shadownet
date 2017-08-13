const db = require('./firebase').database();
const utils = require('./utils');

function createPost({username, txt}) {
  const post = {
    key: utils.hexUUID(),
    username: username,
    text: txt,
    md5: utils.tomd5(txt),
    date: "2074/07/11",
    time: "14:04:41"
  }
  db.ref('threads/').push(post);
  return post;
}

window.createPost = createPost;

module.exports = {
  createPost: createPost
}
