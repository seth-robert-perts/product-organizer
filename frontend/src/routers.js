import {createRouter, createWebHistory} from 'vue-router'
import Home from './components/Home'
import CreateUpdate from './components/CreateUpdate'

const routes = [
    {
        path:'/',
        name:'home',
        component:Home
    },
    {
        path:'/create_update',
        name:'create_update',
        component:CreateUpdate
    }
]

const router = createRouter({
    history:createWebHistory(),
    routes,
})

export default router;