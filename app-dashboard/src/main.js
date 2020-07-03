import Vue from 'vue'
import App from './components/App.vue'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router';

import { routes } from './routes';

import Sidebar from './components/shared/sidebar.vue'
import Header from './components/shared/Header.vue'
import Footer from './components/shared/Footer.vue'

Vue.use(VueResource);
Vue.use(VueRouter);

const router = new VueRouter({
  routes
});

Vue.component("app-header", Header);
Vue.component("app-footer", Footer);
Vue.component("app-sidebar", Sidebar);


new Vue({
  el: '#app',
  router,
  render: h => h(App)
})