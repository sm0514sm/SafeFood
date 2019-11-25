<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import Notice from "./components/Notice";
import NoticeDetail from "./components/NoticeDetail";
import UpdateNotice from "./components/UpdateNotice";
import AddNotice from "./components/AddNotice";

import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Notice },
    { path: "/notice.html", component: Notice },
    { path: "/notice.jsp", component: Notice },
    { path: "/detail/:no", component: NoticeDetail },
    { path: "/updateNotice/:no", component: UpdateNotice },
    { path: "/addNotice", component: AddNotice }
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
