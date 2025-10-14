<style scoped>
/* 今日事项视图 */
.today-view {
  padding: 0;
  height: 100%;
  display: flex;
  flex-direction: column;
  box-sizing: border-box;
  overflow: hidden;
}

/* 今日事项主卡片 */
.today-card {
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  overflow: hidden;
  flex: 6;
  display: flex;
  flex-direction: column;
  min-height: 0;
  margin: 16px 20px 0 20px;
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
  padding: 24px;
  flex: 1;
  overflow-y: auto;
  min-height: 0;
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
  border-radius: 6px;
  border-left: 3px solid #e5e7eb;
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-left-width: 3px;
  transition: all 0.2s ease;
}

.course-item:hover {
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
}

.course-item.completed {
  border-left-color: #22c55e;
  background: #ffffff;
}

.course-item.current {
  border-left-color: #f59e0b;
  background: #ffffff;
  box-shadow: 0 2px 6px rgba(245, 158, 11, 0.1);
}

.course-item.upcoming {
  border-left-color: #3b82f6;
  background: #ffffff;
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
  border-radius: 4px;
  font-size: 11px;
  font-weight: 500;
  border: 1px solid;
}

.course-status.done {
  background: #f0fdf4;
  color: #16a34a;
  border-color: #bbf7d0;
}

.course-status.ongoing {
  background: #fffbeb;
  color: #d97706;
  border-color: #fde68a;
}

.course-status.coming {
  background: #eff6ff;
  color: #2563eb;
  border-color: #bfdbfe;
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
  border-left: 3px solid #3b82f6;
  background: #ffffff;
}

.todo-item.normal {
  border-left: 3px solid #d1d5db;
  background: #ffffff;
}

.todo-item.overdue {
  border-left: 3px solid #dc2626;
  background: #ffffff;
}

.todo-item.completed {
  background: #f9fafb;
  opacity: 0.7;
}

.todo-item.completed .todo-label {
  text-decoration: line-through;
  color: #6b7280;
}

.todo-item.overdue .todo-label {
  color: #991b1b;
}

.todo-checkbox {
  cursor: pointer;
}

.todo-checkbox:disabled {
  cursor: not-allowed;
  opacity: 0.5;
}

.todo-label {
  flex: 1;
  font-size: 14px;
  color: #1f2937;
}

.todo-deadline {
  font-size: 11px;
  color: #6b7280;
  white-space: nowrap;
}

.todo-item.urgent .todo-deadline {
  color: #2563eb;
  font-weight: 600;
}

.todo-item.overdue .todo-deadline {
  color: #dc2626;
  font-weight: 600;
}

/* 智能推荐区域 */
.smart-recommendation {
  margin: 12px 20px 20px 20px;
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 16px 20px;
  flex: 4;
  display: flex;
  flex-direction: column;
  min-height: 0;
}

.recommendation-header {
  display: flex;
  align-items: center;
  gap: 6px;
  margin-bottom: 10px;
}

.recommendation-icon {
  font-size: 18px;
}

.recommendation-title {
  font-size: 15px;
  font-weight: 600;
  color: #1f2937;
}

.recommendation-badge {
  padding: 2px 6px;
  background: #fef2f2;
  color: #dc2626;
  font-size: 10px;
  font-weight: 500;
  border-radius: 3px;
  border: 1px solid #fecaca;
}

.recommendation-content {
  color: #6b7280;
  font-size: 13px;
  line-height: 1.5;
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow-y: auto;
  min-height: 0;
}

.recommendation-placeholder {
  text-align: center;
  padding: 20px;
  color: #9ca3af;
  font-size: 13px;
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
    padding: 12px;
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

  .smart-recommendation {
    margin-top: 12px;
    padding: 14px 16px;
  }

  .recommendation-placeholder {
    padding: 20px 16px;
  }
}
</style>

<script setup>
import { ref, onMounted, computed } from 'vue';
import { ElMessage } from 'element-plus';

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
// 对应数据库表：class_session, edu_course, sys_user, edu_classroom

// 今日课程
const todayCourses = ref([
  {
    session_id: 3001, // class_session.session_id
    course_id: 601, // edu_course.course_id
    course_name: '高等数学', // edu_course.course_name
    teacher_id: 211, // edu_teacher.teacher_id
    teacher_name: '王老师', // sys_user.real_name
    classroom_id: 301, // edu_classroom.classroom_id
    classroom_name: '数学楼A301', // edu_classroom.building + classroom_name
    start_time: '2025-01-15 08:00:00', // class_session.start_time（DATETIME）
    end_time: '2025-01-15 09:40:00', // class_session.end_time（DATETIME）
    status: 'ENDED', // class_session.status（ENUM: 'NOT_STARTED','ONGOING','ENDED'）
  },
  {
    session_id: 3002,
    course_id: 604,
    course_name: '线性代数',
    teacher_id: 214,
    teacher_name: '李老师',
    classroom_id: 302,
    classroom_name: '数学楼B205',
    start_time: '2025-01-15 10:00:00',
    end_time: '2025-01-15 11:40:00',
    status: 'ONGOING',
  },
  {
    session_id: 3003,
    course_id: 611,
    course_name: '概率论与数理统计',
    teacher_id: 221,
    teacher_name: '张老师',
    classroom_id: 303,
    classroom_name: '数学楼C102',
    start_time: '2025-01-15 14:00:00',
    end_time: '2025-01-15 15:40:00',
    status: 'NOT_STARTED',
  },
]);

// 待办事项
// 对应数据库表：sys_todo
const todoItems = ref([
  {
    todo_id: 4001, // sys_todo.todo_id
    user_id: 1001, // sys_todo.user_id
    title: '完成高等数学作业', // sys_todo.title
    content: '第三章习题 1-20题', // sys_todo.content
    todo_type: 'TEACHING', // sys_todo.todo_type（ENUM）
    priority: 'HIGH', // sys_todo.priority（ENUM: 'LOW','MEDIUM','HIGH'）
    deadline: '2025-10-16 23:59:00', // sys_todo.deadline（DATETIME）
    is_completed: 0, // sys_todo.is_completed（0-未完成，1-已完成）
  },
  {
    todo_id: 4002,
    user_id: 1001,
    title: '预习线性代数第三章',
    content: '矩阵运算和行列式',
    todo_type: 'TEACHING',
    priority: 'MEDIUM',
    deadline: '2025-10-12 23:59:00',
    is_completed: 0,
  },
  {
    todo_id: 4003,
    user_id: 1001,
    title: '提交实验报告',
    content: 'Java Web实验三',
    todo_type: 'TEACHING',
    priority: 'MEDIUM',
    deadline: '2025-10-15 23:59:00',
    is_completed: 0,
  },
  {
    todo_id: 4004,
    user_id: 1001,
    title: '复习概率论重点',
    content: '大数定律和中心极限定理',
    todo_type: 'TEACHING',
    priority: 'MEDIUM',
    deadline: '2025-10-14 23:59:00',
    is_completed: 0,
  },
  {
    todo_id: 4005,
    user_id: 1001,
    title: '观看数据结构课程回放',
    content: '第五章 树和二叉树',
    todo_type: 'TEACHING',
    priority: 'LOW',
    deadline: '2025-01-14 23:59:00',
    is_completed: 1,
    complete_time: '2025-01-14 20:30:00', // sys_todo.complete_time
  },
]);
// ==================== 🔴 模拟数据 END ====================

// 添加待办事项
const handleAddTodo = () => {
  ElMessage.info('添加待办事项功能开发中');
};

// 判断是否已截止
const isOverdue = deadline => {
  const date = new Date(deadline);
  const now = new Date();
  return date < now;
};

// 切换待办状态
const toggleTodo = todo => {
  // 已截止的事项不能更改状态
  if (isOverdue(todo.deadline) && todo.is_completed === 0) {
    ElMessage.warning('已截止的待办事项无法更改状态');
    return;
  }

  todo.is_completed = todo.is_completed === 1 ? 0 : 1;
  if (todo.is_completed === 1) {
    todo.complete_time = new Date().toISOString();
  } else {
    todo.complete_time = null;
  }
};

// 排序后的待办事项（用于前端显示）
// 排序规则：未完成（未截止） -> 未完成（已截止） -> 已完成
const sortedTodoItems = computed(() => {
  return [...todoItems.value].sort((a, b) => {
    // 已完成的排在最后
    if (a.is_completed !== b.is_completed) {
      return a.is_completed - b.is_completed;
    }

    // 都是未完成的，已截止的排在未截止的后面
    if (a.is_completed === 0) {
      const aOverdue = isOverdue(a.deadline);
      const bOverdue = isOverdue(b.deadline);
      if (aOverdue !== bOverdue) {
        return aOverdue ? 1 : -1;
      }
    }

    // 相同状态按截止时间排序
    return new Date(a.deadline) - new Date(b.deadline);
  });
});

// 格式化时间显示（用于前端显示）
const formatDeadline = deadline => {
  const date = new Date(deadline);
  const now = new Date();
  const diff = date - now;
  const days = Math.floor(diff / (1000 * 60 * 60 * 24));

  if (days < 0) return '已截止';
  if (days === 0) return '今天截止';
  if (days === 1) return '明天截止';
  if (days <= 7) return `${days}天后`;
  return date.toLocaleDateString();
};

// 获取课程状态文本（用于前端显示）
const getStatusText = status => {
  const statusMap = {
    ENDED: '已完成',
    ONGOING: '进行中',
    NOT_STARTED: '未开始',
  };
  return statusMap[status] || status;
};

// 格式化时间范围（用于前端显示）
const formatTimeRange = (start, end) => {
  const startTime = new Date(start);
  const endTime = new Date(end);
  return `${startTime.getHours().toString().padStart(2, '0')}:${startTime
    .getMinutes()
    .toString()
    .padStart(2, '0')} - ${endTime
    .getHours()
    .toString()
    .padStart(2, '0')}:${endTime.getMinutes().toString().padStart(2, '0')}`;
};
</script>

<template>
  <div class="today-view">
    <!-- 今日事项主卡片 -->
    <div class="today-card">
      <div class="today-header">
        <div class="today-header-left">
          <h2>今日事项</h2>
        </div>
        <div class="today-datetime">{{ currentDateTime }}</div>
      </div>

      <div class="today-content">
        <!-- 左侧：今日课程 -->
        <div class="today-courses">
          <div class="section-header">
            <div class="section-title">
              <span>今日课程</span>
            </div>
            <a class="section-link" @click="handleViewSchedule">查看课表</a>
          </div>

          <div class="course-timeline">
            <div
              v-for="course in todayCourses"
              :key="course.session_id"
              :class="[
                'course-item',
                course.status === 'ENDED'
                  ? 'completed'
                  : course.status === 'ONGOING'
                    ? 'current'
                    : 'upcoming',
              ]"
            >
              <div class="course-time">
                {{ formatTimeRange(course.start_time, course.end_time) }}
              </div>
              <div class="course-info">
                <div class="course-title">
                  <span class="course-name">{{ course.course_name }}</span>
                  <span
                    :class="[
                      'course-status',
                      course.status === 'ENDED'
                        ? 'done'
                        : course.status === 'ONGOING'
                          ? 'ongoing'
                          : 'coming',
                    ]"
                  >
                    {{ getStatusText(course.status) }}
                  </span>
                </div>
                <div class="course-details">
                  <span>教室：{{ course.classroom_name }}</span>
                  <span>教师：{{ course.teacher_name }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 右侧：待办事项 -->
        <div class="today-todos">
          <div class="section-header">
            <div class="section-title">
              <span>待办事项</span>
            </div>
            <a class="section-link" @click="handleAddTodo">添加</a>
          </div>

          <div class="todo-list">
            <div
              v-for="todo in sortedTodoItems"
              :key="todo.todo_id"
              :class="[
                'todo-item',
                {
                  urgent:
                    todo.priority === 'HIGH' &&
                    todo.is_completed === 0 &&
                    !isOverdue(todo.deadline),
                  normal:
                    todo.priority !== 'HIGH' &&
                    todo.is_completed === 0 &&
                    !isOverdue(todo.deadline),
                  overdue: isOverdue(todo.deadline) && todo.is_completed === 0,
                  completed: todo.is_completed === 1,
                },
              ]"
            >
              <input
                type="checkbox"
                :checked="todo.is_completed === 1"
                :disabled="isOverdue(todo.deadline) && todo.is_completed === 0"
                class="todo-checkbox"
                @change="toggleTodo(todo)"
              />
              <div class="todo-label">
                {{ todo.title }}
              </div>
              <span class="todo-deadline">
                {{
                  todo.is_completed === 1
                    ? '已完成'
                    : formatDeadline(todo.deadline)
                }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 智能推荐区域（预留） -->
    <div class="smart-recommendation">
      <div class="recommendation-header">
        <span class="recommendation-title">今日智能推荐</span>
        <span class="recommendation-badge">暂定</span>
      </div>
      <div class="recommendation-content">
        <div class="recommendation-placeholder">
          该功能正在开发中，敬请期待...
        </div>
      </div>
    </div>
  </div>
</template>
