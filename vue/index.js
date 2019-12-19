import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import ListReadings from '@/components/ListReadings'

Vue.use(Router)

let router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Hello',
      components: Hello
    },
    {
      path: '/readings-manager',
      name: 'ListReadings',
      component: ListReadings
    }
  ]
})

export default router