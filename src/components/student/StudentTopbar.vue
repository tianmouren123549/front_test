<style scoped>
.topbar {
  background: #ffffff;
  padding: 14px 24px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-bottom: 1px solid #e5e7eb;
  position: sticky;
  top: 0;
  z-index: 998;
  gap: 20px;
}

.announce-area {
  flex: 1;
  display: flex;
  align-items: center;
}

.announce-inline {
  color: #a16207;
  font-size: 13px;
  background: #fffbeb;
  border: 1px solid #fde68a;
  padding: 8px 16px;
  border-radius: 999px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 100%;
}

.user-area {
  display: flex;
  align-items: center;
  gap: 10px;
  flex-shrink: 0;
}

.user-name {
  color: #6b7280;
  font-size: 14px;
}

.user-avatar {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  cursor: pointer;
}

/* 响应式 */
@media (max-width: 860px) {
  .announce-inline {
    font-size: 12px;
    padding: 6px 12px;
  }
}
</style>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { ElMessage, ElMessageBox } from 'element-plus';

const router = useRouter();

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API获取用户信息
// API接口: GET /api/user/info
// 目前从 sessionStorage 读取登录时存储的用户信息（临时方案）

// 用户信息
// 对应数据库表：sys_user, edu_student
const userInfo = ref({
  user_id: null, // sys_user.user_id
  nick_name: '', // sys_user.nick_name（昵称/显示名）
  avatar: '', // sys_user.avatar（头像）
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
      user_id: data.userId || null,
      nick_name: data.name || '',
      avatar:
        data.avatar ||
        'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png',
    };
  } catch (e) {
    console.error('解析用户信息失败', e);
    router.push('/login');
  }
});
// ==================== 🔴 模拟数据 END ====================

// 退出登录
const handleLogout = () => {
  ElMessageBox.confirm('确定要退出登录吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  })
    .then(() => {
      sessionStorage.removeItem('currentUser');
      localStorage.removeItem('rememberedUser');
      ElMessage.success('已退出登录');
      router.push('/login');
    })
    .catch(() => {
      // 取消
    });
};

// 个人中心
const goToProfile = () => {
  ElMessage.info('个人中心功能开发中');
};
</script>

<template>
  <div class="topbar">
    <div class="announce-area">
      <span class="announce-inline"
        >公告栏：本周起上课时间调整为 8:30 开始</span
      >
    </div>

    <div class="user-area">
      <span class="user-name">{{ userInfo.nick_name }}</span>
      <el-dropdown @command="handleLogout">
        <img :src="userInfo.avatar" alt="avatar" class="user-avatar" />
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="goToProfile">
              <el-icon><User /></el-icon>
              <span>个人中心</span>
            </el-dropdown-item>
            <el-dropdown-item divided command="logout">
              <el-icon><SwitchButton /></el-icon>
              <span>退出登录</span>
            </el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>
