<style scoped>
.sidebar {
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  width: 257px;
  background: #ffffff;
  color: #1f2544;
  padding: 20px 16px;
  display: flex;
  flex-direction: column;
  gap: 16px;
  border-right: 1px solid #e5e7eb;
  overflow-y: auto;
  z-index: 999;
}

.brand {
  font-weight: 700;
  letter-spacing: 0.5px;
  color: #64748b;
  font-size: 16px;
}

.profile {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 8px;
  background: #f8fafc;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
}

.profile img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid rgba(255, 255, 255, 0.25);
}

.profile-info {
  flex: 1;
}

.profile-name {
  font-size: 16px;
  font-weight: 600;
  color: #1f2544;
}

.profile-id {
  opacity: 0.7;
  font-size: 13px;
  color: #6b7280;
}

.menu {
  display: flex;
  flex-direction: column;
  gap: 6px;
  margin-top: 8px;
}

.menu-item {
  color: #334155;
  text-decoration: none;
  padding: 12px 14px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  transition: all 0.2s;
  font-size: 15px;
  font-weight: 500;
}

.menu-item:hover {
  background: #f1f5f9;
}

.menu-item.active {
  background: #f1f5f9;
  color: var(--primary-color);
  font-weight: 600;
}

/* 响应式 */
@media (max-width: 860px) {
  .sidebar {
    position: fixed;
    top: 0;
    left: -257px;
    transition: left 0.3s;
    z-index: 1000;
  }

  .sidebar.mobile-open {
    left: 0;
    box-shadow: 2px 0 8px rgba(0, 0, 0, 0.1);
  }
}
</style>

<script setup>
import { ref, inject, onMounted } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const currentView = inject('currentView');
const switchView = inject('switchView');

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API获取用户信息
// API接口: GET /api/user/info
// 目前从 sessionStorage 读取登录时存储的用户信息（临时方案）

// 用户信息（从 sessionStorage 获取）
const userInfo = ref({
  name: '',
  id: '',
  role: '',
});

onMounted(() => {
  const userStr = sessionStorage.getItem('currentUser');
  if (!userStr) {
    // 未登录，跳转到登录页
    router.push('/login');
    return;
  }

  try {
    const data = JSON.parse(userStr);
    // 验证用户角色是否为学生
    if (data.roleType !== 'student') {
      router.push('/login');
      return;
    }

    userInfo.value = {
      name: data.name || '',
      id: data.username || '',
      role: data.role || '',
    };
  } catch (e) {
    console.error('解析用户信息失败', e);
    router.push('/login');
  }
});

// 菜单项（可能需要根据用户权限动态生成）
// TODO: 后续可能从API获取菜单配置
const menuItems = ref([
  { id: 'schedule', name: '课程/课表', view: 'schedule' },
  { id: 'today', name: '今日事项', view: 'today' },
  { id: 'tasks', name: '我的任务', view: 'tasks' },
  { id: 'inbox', name: '收件箱', view: 'inbox' },
  { id: 'path', name: '学习路径规划', view: 'path' },
]);
// ==================== 🔴 模拟数据 END ====================

// 切换菜单
const handleMenuClick = view => {
  switchView(view);
};
</script>

<template>
  <aside class="sidebar">
    <div class="brand">北泽智慧教学平台（学生端）</div>

    <div class="profile">
      <img
        src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
        alt="avatar"
      />
      <div class="profile-info">
        <div class="profile-name">{{ userInfo.name }}</div>
        <div class="profile-id">{{ userInfo.id }}</div>
      </div>
    </div>

    <nav class="menu">
      <a
        v-for="item in menuItems"
        :key="item.id"
        :class="['menu-item', { active: currentView === item.view }]"
        @click="handleMenuClick(item.view)"
      >
        <span>{{ item.icon }}</span>
        <span>{{ item.name }}</span>
      </a>
    </nav>
  </aside>
</template>
