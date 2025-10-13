<style scoped>
/* 我的任务视图 */
.my-tasks {
  padding: 20px 24px;
}

/* 筛选器 */
.task-filter {
  display: flex;
  gap: 12px;
  margin-bottom: 20px;
  padding-bottom: 16px;
  border-bottom: 1px solid #e5e7eb;
}

.filter-btn {
  padding: 8px 16px;
  border: 1px solid #e5e7eb;
  background: #ffffff;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 500;
  color: #6b7280;
  cursor: pointer;
  transition: all 0.2s ease;
}

.filter-btn:hover {
  background: #f3f4f6;
  border-color: #d1d5db;
}

.filter-btn.active {
  background: var(--primary-color);
  color: white;
  border-color: var(--primary-color);
}

.task-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.task-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 18px 20px;
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  transition: all 0.2s ease;
  cursor: pointer;
}

.task-item:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transform: translateY(-2px);
}

.task-item-content {
  flex: 1;
}

.task-title {
  font-weight: 600;
  font-size: 15px;
  color: #1f2937;
  margin-bottom: 6px;
}

.task-meta {
  color: #6b7280;
  font-size: 12px;
  display: flex;
  gap: 10px;
  align-items: center;
}

.task-status {
  padding: 6px 14px;
  border-radius: 16px;
  font-size: 12px;
  font-weight: 600;
  white-space: nowrap;
  transition: all 0.2s ease;
}

.status-pending {
  background: #dbeafe;
  color: #1e40af;
  border: 1px solid #93c5fd;
}

.status-completed {
  background: #f3f4f6;
  color: #6b7280;
  border: 1px solid #d1d5db;
}

.task-item:hover .status-pending {
  background: #3b82f6;
  color: white;
  border-color: #3b82f6;
}

.task-item:hover .status-completed {
  background: #e5e7eb;
  color: #4b5563;
  border-color: #9ca3af;
}

/* 响应式 */
@media (max-width: 860px) {
  .my-tasks {
    padding: 16px;
  }

  .task-item {
    flex-direction: column;
    align-items: flex-start;
    gap: 12px;
    padding: 16px;
  }

  .task-meta {
    flex-direction: column;
    align-items: flex-start;
    gap: 6px;
  }

  .task-status {
    align-self: flex-end;
  }
}
</style>

<script setup>
import { ref, computed } from 'vue';
import { ElMessage } from 'element-plus';

// 当前筛选状态：all | pending | completed
const currentFilter = ref('all');

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API获取真实数据
// API接口: GET /api/student/tasks

// 作业清单
const taskList = ref([
  {
    id: 1,
    title: '实验作业：设计模式综合',
    deadline: '周五 23:00',
    points: 100,
    status: 'pending',
    statusText: '未完成',
  },
  {
    id: 2,
    title: '编程作业：Java Web应用开发',
    deadline: '周日 23:59',
    points: 80,
    status: 'pending',
    statusText: '未完成',
  },
  {
    id: 3,
    title: '随堂练习：行为型模式',
    deadline: '今日 24:00',
    points: 10,
    status: 'completed',
    statusText: '已完成',
  },
  {
    id: 4,
    title: '课堂测验：数据结构基础',
    deadline: '昨日 18:00',
    points: 50,
    status: 'completed',
    statusText: '已完成',
  },
]);
// ==================== 🔴 模拟数据 END ====================

// 筛选后的任务列表
const filteredTaskList = computed(() => {
  if (currentFilter.value === 'all') {
    return taskList.value;
  }
  return taskList.value.filter(item => item.status === currentFilter.value);
});

// 切换筛选器
const setFilter = filter => {
  currentFilter.value = filter;
};

// 点击任务（只查看详情，不改变状态）
const handleTaskClick = task => {
  ElMessage.info(`任务详情功能开发中：${task.title}`);
};
</script>

<template>
  <div class="my-tasks">
    <!-- 筛选器 -->
    <div class="task-filter">
      <button
        :class="['filter-btn', { active: currentFilter === 'all' }]"
        @click="setFilter('all')"
      >
        全部
      </button>
      <button
        :class="['filter-btn', { active: currentFilter === 'pending' }]"
        @click="setFilter('pending')"
      >
        未完成
      </button>
      <button
        :class="['filter-btn', { active: currentFilter === 'completed' }]"
        @click="setFilter('completed')"
      >
        已完成
      </button>
    </div>

    <!-- 任务列表 -->
    <div class="task-list">
      <div
        v-for="task in filteredTaskList"
        :key="task.id"
        class="task-item"
        @click="handleTaskClick(task)"
      >
        <div class="task-item-content">
          <div class="task-title">{{ task.title }}</div>
          <div class="task-meta">
            <span>截止 {{ task.deadline }}</span>
            <span>·</span>
            <span>{{ task.points }}分</span>
          </div>
        </div>
        <span
          :class="[
            'task-status',
            task.status === 'pending' ? 'status-pending' : 'status-completed',
          ]"
        >
          {{ task.statusText }}
        </span>
      </div>
    </div>
  </div>
</template>
