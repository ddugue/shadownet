const firebase = require('./firebase');

const Vue = require('vue');
const VueFire = require('vuefire');

const other = require('./other');
const blou = require('./test/blou');
const ShortPost = require('./components/shortPost.vue');

const db = firebase.database();

Vue.use(VueFire);
console.log("TEST!");
const app = new Vue({
  el: "#app",
  data: {
    message: "Hello World 8!",
  },
  components: {
    'short-post': ShortPost,
  },
  firebase: {
    posts: db.ref('threads/'),
  }
});
