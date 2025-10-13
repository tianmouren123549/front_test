import { createRouter, createWebHistory } from 'vue-router';
import HomePage from '../views/HomePage.vue';
import Login from '../views/Login.vue';
import StudentLayout from '../views/StudentLayout.vue';
import StudentDashboard from '../views/StudentDashboard.vue';
import CourseDetail from '../views/CourseDetail.vue';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: HomePage,
    meta: {
      title: '首页 - 北泽智慧教学平台',
    },
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: {
      title: '登录 - 北泽智慧教学平台',
    },
  },
  {
    path: '/student',
    name: 'Student',
    component: StudentLayout,
    meta: {
      title: '学生端 - 北泽智慧教学平台',
    },
    children: [
      {
        path: '',
        name: 'StudentDashboard',
        component: StudentDashboard,
        meta: {
          title: '课程/课表 - 北泽智慧教学平台',
        },
      },
    ],
  },
  {
    path: '/student/course-detail',
    name: 'CourseDetail',
    component: CourseDetail,
    meta: {
      title: '课程详情 - 北泽智慧教学平台',
    },
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// 路由守卫：设置页面标题
router.beforeEach((to, from, next) => {
  document.title = to.meta.title || '北泽智慧教学平台';
  next();
});

export default router;
