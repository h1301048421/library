import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import store from "./store";
import 'font-awesome/css/font-awesome.min.css'

import {postKeyValueRequest} from "./utils/api";
import {postRequest} from "./utils/api";
import {getRequest} from "./utils/api";
import {putRequest} from "./utils/api";
import {deleteRequest} from "./utils/api";
import {initMenu} from "./utils/menus";

Vue.prototype.postRequest=postRequest;
Vue.prototype.getRequest=getRequest;
Vue.prototype.putRequest=putRequest;
Vue.prototype.deleteRequest=deleteRequest;
Vue.prototype.postKeyValueRequest=postKeyValueRequest;


Vue.config.productionTip = false
Vue.use(ElementUI)

router.beforeEach((to,from,next)=>{
  if (to.path=='/'){
    next();
  }else{
    if (window.sessionStorage.getItem("user")){
      initMenu(router,store);
      next();
    }else{
      next('/?redirect='+to.path);
    }

  }
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
