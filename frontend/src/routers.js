import {createRouter, createWebHistory} from 'vue-router'
import Home from './components/Home'
import CreateUpdate from './components/CreateUpdate'

// Define routes to be utilized in the Home and Create/Update pages
const routes = [
    {
        path:'/',
        name:'home',
        component:Home
    },
    {
        path:'/create-update',
        name:'create-update',
        component:CreateUpdate
    }
]

const router = createRouter({
    history:createWebHistory(),
    routes,
})

export default router;