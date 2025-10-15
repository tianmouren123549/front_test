<style>
/* 覆盖全局 body 样式（学生端不需要顶部导航栏间距） */
body {
  padding-top: 0 !important;
}
</style>

<style scoped>
/* 学生端整体布局 */
.student-layout {
  display: flex;
  min-height: 100vh;
  background: #f7f8fb;
  overflow: hidden;
}

.layout-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  margin-left: 257px;
  overflow: hidden;
  min-width: 0; /* 允许flex子项收缩 */
}

/* 遮罩层样式继承自 components.css */

/* 响应式 */
@media (max-width: 860px) {
  .layout-content {
    margin-left: 0;
  }
}
</style>

<script setup>
import { ref, provide } from 'vue';
import StudentSidebar from '@/components/student/StudentSidebar.vue';
import StudentTopbar from '@/components/student/StudentTopbar.vue';
import SidebarOverlay from '@/components/common/SidebarOverlay.vue';

// 当前激活的视图
const currentView = ref('schedule'); // schedule | today | tasks | inbox | path

// 侧边栏是否打开（移动端）
const sidebarOpen = ref(false);

// 提供给子组件
provide('currentView', currentView);
provide('sidebarOpen', sidebarOpen);

// 切换视图
const switchView = view => {
  currentView.value = view;
  // 切换视图后关闭侧边栏（移动端）
  sidebarOpen.value = false;
};

provide('switchView', switchView);

// 切换侧边栏显示/隐藏
const toggleSidebar = () => {
  sidebarOpen.value = !sidebarOpen.value;
};

provide('toggleSidebar', toggleSidebar);

// 关闭侧边栏
const closeSidebar = () => {
  sidebarOpen.value = false;
};
</script>

<template>
  <div class="student-layout">
    <!-- 遮罩层 -->
    <SidebarOverlay :is-show="sidebarOpen" @close="closeSidebar" />

    <StudentSidebar />
    <div class="layout-content">
      <StudentTopbar />
      <router-view />
    </div>
  </div>
</template>
