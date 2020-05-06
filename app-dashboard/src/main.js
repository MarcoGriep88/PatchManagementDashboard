import Vue from 'vue'
import App from './components/App.vue'
import VueResource from 'vue-resource'

import Header from './components/shared/Header.vue'
import Sidebar from './components/shared/Sidebar.vue'
import Footer from './components/shared/Footer.vue'

import CustomerOverview from './components/server/UpgradableOverview.vue'

Vue.use(VueResource);

Vue.component("app-header", Header);
Vue.component("app-sidebar", Sidebar);
Vue.component("app-footer", Footer);

Vue.component("app-upgradable-overview", CustomerOverview);

new Vue({
  el: '#app',
  render: h => h(App)
})
