<template>
  <div id="app">
    <router-view></router-view>
    <quiz-score></quiz-score>
  </div>
</template>

<script>
import QuizMain from "./components/QuizMain";
import Quiz from "./components/Quiz";
import QuizScore from "./components/QuizScore";
import QuizEnd from "./components/QuizEnd";
import VueRouter from "vue-router";
import Vue from "vue";

Vue.use(VueRouter);
const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: QuizMain },
    { path: "/quiz.html", component: QuizMain },
    { path: "/quiz.jsp", component: QuizMain },
    { path: "/quiz", component: Quiz },
    { path: "/quizEnd", component: QuizEnd }
  ]
});
export default {
  name: "app",
  components: {
    QuizScore
  },
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
