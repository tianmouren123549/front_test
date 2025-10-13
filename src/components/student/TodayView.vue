<style scoped>
/* 今日事项视图 */
.today-view {
  padding: 20px 24px;
}

/* 快速学习卡片 */
.quick-learning-card {
  margin-bottom: 20px;
  padding: 20px;
  background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
  border-radius: 12px;
}

.quick-learning-header {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 16px;
}

.quick-learning-title {
  font-weight: 700;
  color: #0369a1;
  font-size: 16px;
}

.quick-learning-buttons {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
}

.quick-btn {
  display: flex;
  align-items: center;
  gap: 6px;
  padding: 12px 20px;
  font-size: 15px;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.2s ease;
  font-weight: 500;
}

.quick-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.quick-btn-primary {
  background: var(--primary-color);
  color: white;
}

.quick-btn-success {
  background: #22c55e;
  color: white;
}

.quick-btn-warning {
  background: #f59e0b;
  color: white;
}

/* 今日事项主卡片 */
.today-card {
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  overflow: hidden;
}

.today-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 20px;
  border-bottom: 1px solid #e5e7eb;
}

.today-header-left {
  display: flex;
  align-items: center;
  gap: 8px;
}

.today-header h2 {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
}

.today-datetime {
  color: #6b7280;
  font-size: 14px;
}

.today-content {
  display: grid;
  grid-template-columns: 3fr 2fr;
  gap: 24px;
  padding: 20px;
}

/* 今日课程 */
.section-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 16px;
}

.section-title {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 16px;
  font-weight: 600;
}

.section-link {
  color: var(--primary-color);
  text-decoration: none;
  font-size: 12px;
  cursor: pointer;
}

.section-link:hover {
  text-decoration: underline;
}

.course-timeline {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.course-item {
  display: flex;
  gap: 16px;
  padding: 16px;
  border-radius: 10px;
  border-left: 4px solid #e5e7eb;
  background: #fafafa;
  transition: all 0.2s ease;
}

.course-item:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transform: translateX(2px);
}

.course-item.completed {
  border-left-color: #22c55e;
  background: linear-gradient(135deg, #f0fdf4, #dcfce7);
}

.course-item.current {
  border-left-color: #f59e0b;
  background: linear-gradient(135deg, #fffbeb, #fef3c7);
  box-shadow: 0 2px 8px rgba(245, 158, 11, 0.15);
}

.course-item.upcoming {
  border-left-color: #3b82f6;
  background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
}

.course-time {
  min-width: 100px;
  font-weight: 600;
  color: #1f2937;
  font-size: 14px;
}

.course-info {
  flex: 1;
}

.course-title {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 6px;
}

.course-name {
  font-weight: 600;
  color: #1f2937;
  font-size: 15px;
}

.course-status {
  padding: 2px 8px;
  border-radius: 12px;
  font-size: 10px;
  font-weight: 600;
}

.course-status.done {
  background: #22c55e;
  color: white;
}

.course-status.ongoing {
  background: #f59e0b;
  color: white;
}

.course-status.coming {
  background: #3b82f6;
  color: white;
}

.course-details {
  display: flex;
  gap: 12px;
  color: #6b7280;
  font-size: 12px;
}

/* 待办事项 */
.todo-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.todo-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 12px;
  border-radius: 8px;
  background: #fff;
  border: 1px solid #e5e7eb;
  transition: all 0.2s ease;
}

.todo-item:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.todo-item.urgent {
  border-left: 4px solid #ef4444;
  background: linear-gradient(135deg, #fef2f2, #fee2e2);
}

.todo-item.normal {
  border-left: 4px solid #3b82f6;
}

.todo-item.completed {
  background: #f9fafb;
  opacity: 0.7;
}

.todo-item.completed label {
  text-decoration: line-through;
  color: #6b7280;
}

.todo-checkbox {
  cursor: pointer;
}

.todo-label {
  flex: 1;
  cursor: pointer;
  font-size: 14px;
  color: #1f2937;
}

.todo-deadline {
  font-size: 11px;
  color: #6b7280;
  white-space: nowrap;
}

.todo-item.urgent .todo-deadline {
  color: #ef4444;
  font-weight: 600;
}

/* 响应式 */
@media (max-width: 1200px) {
  .today-content {
    grid-template-columns: 1fr;
    gap: 20px;
  }
}

@media (max-width: 860px) {
  .today-view {
    padding: 16px;
  }

  .today-content {
    padding: 16px;
    gap: 16px;
  }

  .course-item {
    padding: 12px;
  }

  .todo-item {
    padding: 10px;
  }

  .quick-learning-buttons {
    flex-direction: column;
    gap: 12px;
  }

  .quick-btn {
    width: 100%;
    justify-content: center;
  }
}
</style>

<script setup>
import { ref, inject, onMounted } from 'vue';
import { ElMessage } from 'element-plus';

const switchView = inject('switchView');

// 当前日期时间
const currentDateTime = ref('');

const updateDateTime = () => {
  const now = new Date();
  const year = now.getFullYear();
  const month = now.getMonth() + 1;
  const date = now.getDate();
  const hours = String(now.getHours()).padStart(2, '0');
  const minutes = String(now.getMinutes()).padStart(2, '0');
  const weekdays = [
    '星期日',
    '星期一',
    '星期二',
    '星期三',
    '星期四',
    '星期五',
    '星期六',
  ];
  const weekday = weekdays[now.getDay()];
  currentDateTime.value = `${year}年${month}月${date}日${weekday} ${hours}:${minutes}`;
};

onMounted(() => {
  updateDateTime();
  setInterval(updateDateTime, 60000); // 每分钟更新
});

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API获取真实数据
// API接口: GET /api/student/today-schedule

// 今日课程
const todayCourses = ref([
  {
    time: '08:00 - 09:40',
    name: '高等数学',
    status: 'done',
    statusText: '已完成',
    location: '数学楼A301',
    teacher: '王老师',
  },
  {
    time: '10:00 - 11:40',
    name: '线性代数',
    status: 'ongoing',
    statusText: '进行中',
    location: '数学楼B205',
    teacher: '李老师',
  },
  {
    time: '14:00 - 15:40',
    name: '概率论与数理统计',
    status: 'coming',
    statusText: '未开始',
    location: '数学楼C102',
    teacher: '张老师',
  },
]);

// 待办事项
const todoItems = ref([
  {
    id: 1,
    text: '完成高等数学作业',
    deadline: '明天截止',
    urgent: true,
    completed: false,
  },
  {
    id: 2,
    text: '预习线性代数第三章',
    deadline: '3天后',
    urgent: false,
    completed: false,
  },
  {
    id: 3,
    text: '提交实验报告',
    deadline: '本周内',
    urgent: false,
    completed: false,
  },
  {
    id: 4,
    text: '复习概率论重点',
    deadline: '周五前',
    urgent: false,
    completed: false,
  },
  {
    id: 5,
    text: '观看数据结构课程回放',
    deadline: '已完成',
    urgent: false,
    completed: true,
  },
]);
// ==================== 🔴 模拟数据 END ====================

// 快速操作
const handleStartLearning = () => {
  ElMessage.info('进入在线学习功能开发中');
};

const handleViewSchedule = () => {
  switchView('schedule');
};

const handleViewTasks = () => {
  switchView('tasks');
};

// 添加待办事项
const handleAddTodo = () => {
  ElMessage.info('添加待办事项功能开发中');
};

// 切换待办状态
const toggleTodo = todo => {
  todo.completed = !todo.completed;
  if (todo.completed) {
    todo.deadline = '已完成';
  }
};
</script>

<template>
  <div class="today-view">
    <!-- 快速学习入口 -->
    <div class="quick-learning-card">
      <div class="quick-learning-header">
        <span style="font-size: 18px">⚡</span>
        <span class="quick-learning-title">快速学习</span>
      </div>
      <div class="quick-learning-buttons">
        <button
          class="quick-btn quick-btn-primary"
          @click="handleStartLearning"
        >
          <span>查看错题</span>
        </button>
        <button class="quick-btn quick-btn-success" @click="handleViewSchedule">
          <span>查看课表</span>
        </button>
        <button class="quick-btn quick-btn-warning" @click="handleViewTasks">
          <span>我的作业</span>
        </button>
      </div>
    </div>

    <!-- 今日事项主卡片 -->
    <div class="today-card">
      <div class="today-header">
        <div class="today-header-left">
          <span style="font-size: 18px">📅</span>
          <h2>今日事项</h2>
        </div>
        <div class="today-datetime">{{ currentDateTime }}</div>
      </div>

      <div class="today-content">
        <!-- 左侧：今日课程 -->
        <div class="today-courses">
          <div class="section-header">
            <div class="section-title">
              <span>📚</span>
              <span>今日课程</span>
            </div>
            <a class="section-link" @click="handleViewSchedule">查看课表</a>
          </div>

          <div class="course-timeline">
            <div
              v-for="course in todayCourses"
              :key="course.time"
              :class="['course-item', course.status]"
            >
              <div class="course-time">{{ course.time }}</div>
              <div class="course-info">
                <div class="course-title">
                  <span class="course-name">{{ course.name }}</span>
                  <span :class="['course-status', course.status]">
                    {{ course.statusText }}
                  </span>
                </div>
                <div class="course-details">
                  <span>🏢 {{ course.location }}</span>
                  <span>🧑‍🏫 {{ course.teacher }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 右侧：待办事项 -->
        <div class="today-todos">
          <div class="section-header">
            <div class="section-title">
              <span>📋</span>
              <span>待办事项</span>
            </div>
            <a class="section-link" @click="handleAddTodo">添加</a>
          </div>

          <div class="todo-list">
            <div
              v-for="todo in todoItems"
              :key="todo.id"
              :class="[
                'todo-item',
                { urgent: todo.urgent && !todo.completed },
                { normal: !todo.urgent && !todo.completed },
                { completed: todo.completed },
              ]"
            >
              <input
                type="checkbox"
                :id="`todo-${todo.id}`"
                v-model="todo.completed"
                class="todo-checkbox"
                @change="toggleTodo(todo)"
              />
              <label :for="`todo-${todo.id}`" class="todo-label">
                {{ todo.text }}
              </label>
              <span class="todo-deadline">{{ todo.deadline }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
