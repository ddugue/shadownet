<template>
  <div class="reply">
    <div class="header">
      <h3>{{post.key}} [{{post.username}}]</h3>
      <span>– {{post.date}} {{post.time}}.003</span>
      <br />
      <span class="small">{{post.md5}}</span>
    </div>
    <p>{{post.text}}</p>
  </div>
</template>

<script>
  const db = require('../firebase.js').database();

  module.exports = {
    props: ['postId'],
    firebase: function() {
      console.log(`threads/${this.postId}`);
      return {
        post: {
          source: db.ref(`threads/${this.postId}`),
          asObject: true,
        }
      }
    },
    data: function() {
      console.log(this.postId);
      console.log(this.post);
      return {};
    }
  }
</script>

<style scoped>
</style>
