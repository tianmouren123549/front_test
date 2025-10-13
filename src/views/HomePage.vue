<style scoped>
.home-page {
  min-height: 100vh;
}
</style>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';
import Navbar from '@/components/Navbar.vue';
import Carousel from '@/components/Carousel.vue';

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API或CMS系统获取轮播图数据
// API接口: GET /api/carousel/slides

// 轮播图数据
const carouselSlides = ref([
  {
    title: '智慧教室',
    description: '随时随地学习,轻松掌握知识',
    buttonText: '查看更多',
    image: '/images/carousel/001.png',
  },
  {
    title: '智慧教室',
    description: '互动课堂体验,激发学习兴趣',
    buttonText: '查看更多',
    image: '/images/carousel/002.png',
  },
  {
    title: '智慧教室',
    description: '智能教学工具,提升教学质量',
    buttonText: '查看更多',
    image: '/images/carousel/003.png',
  },
  {
    title: '智慧教室',
    description: '实时反馈系统,精准掌握学情',
    buttonText: '查看更多',
    image: '/images/carousel/004.png',
  },
  {
    // title: '智慧教室',
    // description: '数据驱动决策,优化教育资源',
    // buttonText: '查看更多',
    image: '/images/carousel/005.png',
  },
]);
// ==================== 🔴 模拟数据 END ====================

// 首页挂载时禁用 body 滚动
onMounted(() => {
  document.body.style.overflow = 'hidden';
});

// 首页卸载时恢复 body 滚动
onUnmounted(() => {
  document.body.style.overflow = '';
});
</script>

<template>
  <div class="home-page">
    <Navbar />
    <Carousel :slides="carouselSlides" />
  </div>
</template>
