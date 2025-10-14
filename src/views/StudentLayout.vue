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
  height: 100vh;
  background: #f7f8fb;
  overflow: hidden;
}

.layout-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  margin-left: 257px;
  overflow: hidden;
}

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

// 当前激活的视图
const currentView = ref('schedule'); // schedule | today | tasks | inbox | path

// 提供给子组件
provide('currentView', currentView);

// 切换视图
const switchView = view => {
  currentView.value = view;
};

provide('switchView', switchView);
</script>

<template>
  <div class="student-layout">
    <StudentSidebar />
    <div class="layout-content">
      <StudentTopbar />
      <router-view />
    </div>
  </div>
</template>
