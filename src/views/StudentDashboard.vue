<style scoped>
.student-dashboard {
  padding: 0;
  height: calc(100vh - 60px);
  display: flex;
  flex-direction: column;
}

.view-container {
  background: #ffffff;
  border: none;
  border-radius: 0;
  box-shadow: none;
  overflow: hidden;
  flex: 1;
  display: flex;
  flex-direction: column;
  min-height: 0;
}
</style>

<script setup>
import { inject } from 'vue';
import CourseSchedule from '@/components/student/CourseSchedule.vue';
import TodayView from '@/components/student/TodayView.vue';
import MyTasks from '@/components/student/MyTasks.vue';
import Inbox from '@/components/student/Inbox.vue';
import LearningPath from '@/components/student/LearningPath.vue';

const currentView = inject('currentView');
</script>

<template>
  <div class="student-dashboard">
    <div class="view-container">
      <!-- 课程/课表视图 -->
      <CourseSchedule v-if="currentView === 'schedule'" />

      <!-- 今日事项视图 -->
      <TodayView v-else-if="currentView === 'today'" />

      <!-- 我的任务视图 -->
      <MyTasks v-else-if="currentView === 'tasks'" />

      <!-- 收件箱视图 -->
      <Inbox v-else-if="currentView === 'inbox'" />

      <!-- 学习路径规划视图 -->
      <LearningPath v-else-if="currentView === 'path'" />
    </div>
  </div>
</template>
