const firebase = require('firebase');

var config = {
  apiKey: "AIzaSyBC28tw0sLNcKjX97e7wnfPiB9ErY1L2z8",
  authDomain: "shadownet-9b6f8.firebaseapp.com",
  databaseURL: "https://shadownet-9b6f8.firebaseio.com",
  projectId: "shadownet-9b6f8",
  storageBucket: "shadownet-9b6f8.appspot.com",
  messagingSenderId: "1490865942"
};
window.FIREBASE = firebase.initializeApp(config)
module.exports = window.FIREBASE;
