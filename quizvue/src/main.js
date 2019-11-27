import Vue from "vue";
import App from "./App.vue";
import store from "./store";

Vue.config.productionTip = true;
Vue.config.devtools = true;

new Vue({
  render: h => h(App),
  store
}).$mount("#app");
