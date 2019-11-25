<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import Board from "./components/Board";
import BulletinDetail from "./components/BulletinDetail";
import AddBulletin from "./components/AddBulletin";
import UpdateBulletin from "./components/UpdateBulletin";
import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Board },
    { path: "/board", component: Board },
    { path: "/qna.html", component: Board },
    { path: "/QNA.jsp", component: Board },
    { path: "/detail/:no", component: BulletinDetail },
    { path: "/addBulletin", component: AddBulletin },
    { path: "/updateBulletin", component: UpdateBulletin }
  ]
});

export default {
  name: "app",
  components: {},
  router
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
