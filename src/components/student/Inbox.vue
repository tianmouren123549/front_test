<style scoped>
/* 收件箱视图 */
.inbox {
  padding: 20px 24px;
}

/* 筛选器 */
.inbox-filter {
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

.inbox-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.inbox-item {
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

.inbox-item:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transform: translateY(-2px);
}

.inbox-item.unread {
  background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
  border-left: 4px solid #3b82f6;
}

.inbox-item.read {
  background: #fafafa;
  opacity: 0.85;
}

.inbox-item-content {
  flex: 1;
}

.inbox-title {
  font-weight: 600;
  font-size: 15px;
  color: #1f2937;
  margin-bottom: 6px;
}

.inbox-item.unread .inbox-title {
  color: #1e40af;
}

.inbox-description {
  color: #6b7280;
  font-size: 12px;
  line-height: 1.5;
}

.inbox-status {
  padding: 6px 14px;
  border-radius: 16px;
  font-size: 12px;
  font-weight: 600;
  white-space: nowrap;
  transition: all 0.2s ease;
}

.status-unread {
  background: #dbeafe;
  color: #1e40af;
  border: 1px solid #93c5fd;
}

.status-read {
  background: #f3f4f6;
  color: #6b7280;
  border: 1px solid #d1d5db;
}

.inbox-item:hover .status-unread {
  background: #3b82f6;
  color: white;
  border-color: #3b82f6;
}

.inbox-item:hover .status-read {
  background: #e5e7eb;
  color: #4b5563;
  border-color: #9ca3af;
}

/* 响应式 */
@media (max-width: 860px) {
  .inbox {
    padding: 16px;
  }

  .inbox-item {
    flex-direction: column;
    align-items: flex-start;
    gap: 12px;
    padding: 16px;
  }

  .inbox-status {
    align-self: flex-end;
  }
}
</style>

<script setup>
import { ref, computed } from 'vue';
import { ElMessage } from 'element-plus';

// 当前筛选状态：all | unread | read
const currentFilter = ref('all');

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API获取真实数据
// API接口: GET /api/student/messages
// 对应数据库表：stu_message

// 收件箱消息
const inboxList = ref([
  {
    message_id: 7001, // stu_message.message_id
    student_id: 1001, // stu_message.student_id
    sender_id: 217, // stu_message.sender_id
    sender_type: 'TEACHER', // stu_message.sender_type（ENUM: 'SYSTEM','TEACHER','ADMIN'）
    message_type: 'HOMEWORK', // stu_message.message_type（ENUM: 'NOTIFICATION','HOMEWORK','SCORE','REMINDER'）
    title: '作业提醒', // stu_message.title
    content: '请在周五 23:00 前提交"设计模式综合"', // stu_message.content
    priority: 'IMPORTANT', // stu_message.priority（ENUM: 'NORMAL','IMPORTANT','URGENT'）
    is_read: 0, // stu_message.is_read（0-未读，1-已读）
    send_time: '2025-01-15 08:00:00', // stu_message.send_time（DATETIME）
    related_type: 'HOMEWORK', // stu_message.related_type
    related_id: 5001, // stu_message.related_id
  },
  {
    message_id: 7002,
    student_id: 1001,
    sender_id: 217,
    sender_type: 'TEACHER',
    message_type: 'NOTIFICATION',
    title: '老师通知',
    content: '周三 8:30 上课时间调整为 8:50',
    priority: 'NORMAL',
    is_read: 1,
    read_time: '2025-01-14 20:30:00', // stu_message.read_time
    send_time: '2025-01-14 18:00:00',
    related_type: null,
    related_id: null,
  },
  {
    message_id: 7003,
    student_id: 1001,
    sender_id: null,
    sender_type: 'SYSTEM',
    message_type: 'HOMEWORK',
    title: '系统通知',
    content: '您有新的编程作业待完成，请及时查看',
    priority: 'NORMAL',
    is_read: 0,
    send_time: '2025-01-15 10:00:00',
    related_type: 'HOMEWORK',
    related_id: 5002,
  },
  {
    message_id: 7004,
    student_id: 1001,
    sender_id: 219,
    sender_type: 'TEACHER',
    message_type: 'SCORE',
    title: '成绩公布',
    content: '数据结构课堂测验成绩已公布，请查看',
    priority: 'NORMAL',
    is_read: 1,
    read_time: '2025-01-14 22:00:00',
    send_time: '2025-01-14 21:00:00',
    related_type: 'HOMEWORK',
    related_id: 5004,
  },
]);
// ==================== 🔴 模拟数据 END ====================

// 筛选后的消息列表
const filteredInboxList = computed(() => {
  if (currentFilter.value === 'all') {
    return inboxList.value;
  }
  if (currentFilter.value === 'unread') {
    return inboxList.value.filter(item => item.is_read === 0);
  }
  if (currentFilter.value === 'read') {
    return inboxList.value.filter(item => item.is_read === 1);
  }
  return inboxList.value;
});

// 切换筛选器
const setFilter = filter => {
  currentFilter.value = filter;
};

// 点击消息
const handleInboxClick = inbox => {
  // 标记为已读
  if (inbox.is_read === 0) {
    inbox.is_read = 1;
    inbox.read_time = new Date().toISOString();
  }
  ElMessage.info(`消息详情功能开发中：${inbox.title}`);
};

// 获取状态文本（用于前端显示）
const getStatusText = isRead => {
  return isRead === 1 ? '已读' : '未读';
};
</script>

<template>
  <div class="inbox">
    <!-- 筛选器 -->
    <div class="inbox-filter">
      <button
        :class="['filter-btn', { active: currentFilter === 'all' }]"
        @click="setFilter('all')"
      >
        全部
      </button>
      <button
        :class="['filter-btn', { active: currentFilter === 'unread' }]"
        @click="setFilter('unread')"
      >
        未读
      </button>
      <button
        :class="['filter-btn', { active: currentFilter === 'read' }]"
        @click="setFilter('read')"
      >
        已读
      </button>
    </div>

    <!-- 消息列表 -->
    <div class="inbox-list">
      <div
        v-for="inbox in filteredInboxList"
        :key="inbox.message_id"
        :class="['inbox-item', inbox.is_read === 0 ? 'unread' : 'read']"
        @click="handleInboxClick(inbox)"
      >
        <div class="inbox-item-content">
          <div class="inbox-title">{{ inbox.title }}</div>
          <div class="inbox-description">{{ inbox.content }}</div>
        </div>
        <span
          :class="[
            'inbox-status',
            inbox.is_read === 0 ? 'status-unread' : 'status-read',
          ]"
        >
          {{ getStatusText(inbox.is_read) }}
        </span>
      </div>
    </div>
  </div>
</template>
