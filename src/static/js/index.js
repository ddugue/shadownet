const Vue = require('vue');
const other = require('./other');
const blou = require('./test/blou');

console.log("TEST!");
const app = new Vue({
  el: "#app",
  data: {
    message: "Hello World 8!",
  }
});
