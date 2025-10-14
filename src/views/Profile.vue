<template>
  <div class="profile-page">
    <!-- 顶部栏 -->
    <div class="topbar">
      <div class="breadcrumb">
        <a @click="goBack">返回</a>
        <span>/</span>
        <span class="current">个人中心</span>
      </div>
    </div>

    <!-- 统一的内容卡片 -->
    <div class="content">
      <!-- 自定义 Tabs 导航 -->
      <div class="custom-tabs">
        <div
          :class="['tab-item', { active: activeTab === 'profile' }]"
          @click="activeTab = 'profile'"
        >
          <el-icon><User /></el-icon>
          <span>基本资料</span>
        </div>
        <div
          :class="['tab-item', { active: activeTab === 'portrait' }]"
          @click="activeTab = 'portrait'"
        >
          <el-icon><DataAnalysis /></el-icon>
          <span>用户画像</span>
        </div>
        <div
          :class="['tab-item', { active: activeTab === 'password' }]"
          @click="activeTab = 'password'"
        >
          <el-icon><Lock /></el-icon>
          <span>密码管理</span>
        </div>
        <div
          :class="['tab-item', { active: activeTab === 'settings' }]"
          @click="activeTab = 'settings'"
        >
          <el-icon><Setting /></el-icon>
          <span>账号设置</span>
        </div>
      </div>

      <!-- 分隔线 -->
      <el-divider />

      <!-- 基本资料视图 -->
      <div v-show="activeTab === 'profile'">
        <div class="panel">
          <h3 class="panel-title">基本资料</h3>

          <!-- 左右布局容器 -->
          <div class="profile-layout">
            <!-- 左侧：头像区域 -->
            <div class="avatar-card">
              <el-avatar :size="120" :src="userInfo.avatar" />
              <div class="avatar-info">
                <h4>更换头像</h4>
                <p>支持JPG、PNG格式<br />建议尺寸200x200像素</p>
              </div>
              <el-upload
                :show-file-list="false"
                :auto-upload="false"
                :on-change="handleAvatarChange"
                accept="image/*"
              >
                <el-button type="primary" style="width: 100%">
                  选择图片
                </el-button>
              </el-upload>
            </div>

            <!-- 右侧：基本信息表单 -->
            <div class="form-card">
              <el-form
                :model="userInfo"
                label-width="80px"
                clas
                s="profile-form"
              >
                <div class="form-row">
                  <el-form-item label="姓名">
                    <el-input v-model="userInfo.name" />
                  </el-form-item>

                  <el-form-item label="学号">
                    <el-input v-model="userInfo.studentNo" disabled />
                  </el-form-item>
                </div>

                <div class="form-row">
                  <el-form-item label="性别">
                    <el-radio-group v-model="userInfo.gender">
                      <el-radio label="MALE">男</el-radio>
                      <el-radio label="FEMALE">女</el-radio>
                    </el-radio-group>
                  </el-form-item>

                  <el-form-item label="手机号">
                    <el-input
                      v-model="userInfo.phone"
                      placeholder="请输入手机号"
                    >
                      <template #append>
                        <el-button>修改</el-button>
                      </template>
                    </el-input>
                  </el-form-item>
                </div>

                <el-form-item label="邮箱">
                  <el-input
                    v-model="userInfo.email"
                    placeholder="请输入邮箱地址"
                    style="max-width: 400px"
                  >
                    <template #append>
                      <el-button>修改</el-button>
                    </template>
                  </el-input>
                </el-form-item>

                <el-form-item label="单位">
                  <div style="width: 100%">
                    <el-button
                      type="primary"
                      size="small"
                      style="margin-bottom: 12px"
                      @click="handleAddUnit"
                    >
                      + 添加单位
                    </el-button>
                    <div class="units-list">
                      <div
                        v-for="(unit, index) in userInfo.units"
                        :key="index"
                        class="unit-item"
                      >
                        <div>
                          <div class="unit-name">{{ unit.name }}</div>
                          <div class="unit-id">
                            学号/工号：{{ unit.workNo }}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </el-form-item>

                <el-form-item>
                  <el-button type="primary" @click="saveProfile">
                    保存修改
                  </el-button>
                </el-form-item>
              </el-form>
            </div>
          </div>
        </div>
      </div>

      <!-- 用户画像视图 -->
      <div v-show="activeTab === 'portrait'">
        <!-- 学习数据统计 -->
        <div class="metrics-grid">
          <div class="metric-card">
            <div class="ring" :style="{ '--p': 92 }">
              <span>92%</span>
            </div>
            <div class="metric-info">
              <div class="metric-title">课程完成度</div>
              <div class="metric-desc">高于平均水平</div>
              <div class="metric-badge success">学习状态优秀</div>
            </div>
          </div>
          <div class="metric-card">
            <div class="ring" :style="{ '--p': 86 }">
              <span>86%</span>
            </div>
            <div class="metric-info">
              <div class="metric-title">听课率</div>
              <div class="metric-desc">近4周平均</div>
              <div class="metric-badge success">连续7天听课</div>
            </div>
          </div>
          <div class="metric-card">
            <div class="ring" :style="{ '--p': 91 }">
              <span>91%</span>
            </div>
            <div class="metric-info">
              <div class="metric-title">作业完成率</div>
              <div class="metric-desc">平均分：89</div>
              <div class="metric-badge success">无逾期作业</div>
            </div>
          </div>
          <div class="metric-card">
            <div class="ring" :style="{ '--p': 73 }">
              <span>73%</span>
            </div>
            <div class="metric-info">
              <div class="metric-title">到课率</div>
              <div class="metric-desc">含请假统计</div>
              <div class="metric-badge warning">近期请假较多</div>
            </div>
          </div>
        </div>

        <!-- 学习风格标签 -->
        <div class="panel">
          <h3 class="panel-title">学习风格标签</h3>
          <div class="achievement-grid">
            <div class="achievement-item">
              <div class="achievement-icon primary">
                <el-icon><TrendCharts /></el-icon>
              </div>
              <div class="achievement-info">
                <h5>学习达人</h5>
                <p>连续7天完成学习任务</p>
              </div>
            </div>
            <div class="achievement-item">
              <div class="achievement-icon warning">
                <el-icon><Timer /></el-icon>
              </div>
              <div class="achievement-info">
                <h5>速度之星</h5>
                <p>快速完成作业</p>
              </div>
            </div>
            <div class="achievement-item">
              <div class="achievement-icon success">
                <el-icon><Medal /></el-icon>
              </div>
              <div class="achievement-info">
                <h5>满分王者</h5>
                <p>获得5次满分作业</p>
              </div>
            </div>
            <div class="achievement-item">
              <div class="achievement-icon info">
                <el-icon><ChatDotRound /></el-icon>
              </div>
              <div class="achievement-info">
                <h5>积极发言</h5>
                <p>课堂提问超过20次</p>
              </div>
            </div>
          </div>
        </div>

        <!-- 学习分析 -->
        <div class="panel">
          <h3 class="panel-title">学习分析报告</h3>
          <div class="analysis-grid">
            <div class="analysis-box success">
              <h4>优势领域</h4>
              <ul>
                <li>作业完成情况优秀</li>
                <li>基础知识掌握扎实</li>
                <li>学习态度认真</li>
              </ul>
            </div>
            <div class="analysis-box warning">
              <h4>改进建议</h4>
              <ul>
                <li>提高课堂参与度</li>
                <li>加强错题复习</li>
                <li>规律作息时间</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <!-- 密码管理视图 -->
      <div v-show="activeTab === 'password'">
        <div class="panel">
          <h3 class="panel-title">密码管理</h3>
          <el-form
            :model="passwordForm"
            label-width="120px"
            class="profile-form"
          >
            <el-form-item label="当前密码">
              <el-input
                v-model="passwordForm.oldPassword"
                type="password"
                placeholder="请输入当前密码"
                style="width: 300px"
                show-password
              />
            </el-form-item>

            <el-form-item label="新密码">
              <el-input
                v-model="passwordForm.newPassword"
                type="password"
                placeholder="请输入新密码（6-20位）"
                style="width: 300px"
                show-password
              />
            </el-form-item>

            <el-form-item label="确认密码">
              <el-input
                v-model="passwordForm.confirmPassword"
                type="password"
                placeholder="请再次输入新密码（6-20位）"
                style="width: 300px"
                show-password
              />
            </el-form-item>

            <el-form-item>
              <el-button type="primary" @click="changePassword">
                修改密码
              </el-button>
            </el-form-item>
          </el-form>
        </div>
      </div>

      <!-- 账号设置视图 -->
      <div v-show="activeTab === 'settings'">
        <div class="panel">
          <h3 class="panel-title">账号设置</h3>
          <el-form
            :model="settingsForm"
            label-width="120px"
            class="profile-form"
          >
            <el-form-item label="语言设置">
              <el-select v-model="settingsForm.language" style="width: 200px">
                <el-option label="简体中文" value="zh-CN" />
                <el-option label="English" value="en-US" />
              </el-select>
            </el-form-item>

            <el-form-item label="通知设置">
              <el-checkbox v-model="settingsForm.courseNotification">
                接收课程通知
              </el-checkbox>
            </el-form-item>

            <el-form-item label="隐私设置">
              <el-checkbox v-model="settingsForm.showProgress">
                允许其他同学查看我的学习进度
              </el-checkbox>
            </el-form-item>

            <el-divider />

            <el-form-item label="危险操作">
              <el-button type="danger" @click="handleDeleteAccount">
                注销账号
              </el-button>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { ElMessage, ElMessageBox } from 'element-plus';
import { useRouter } from 'vue-router';
import {
  User,
  DataAnalysis,
  Lock,
  Setting,
  TrendCharts,
  Timer,
  Medal,
  ChatDotRound,
} from '@element-plus/icons-vue';

const router = useRouter();

// 返回上一页
const goBack = () => {
  router.push('/student');
};

// 当前激活的选项卡
const activeTab = ref('profile');

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API获取用户信息
// API接口: GET /api/user/profile
// 目前从 sessionStorage 读取登录时存储的用户信息（临时方案）

// 用户信息（从 sessionStorage 获取）
// 对应数据库表：sys_user, edu_student
const userInfo = ref({
  user_id: null, // sys_user.user_id
  student_id: null, // edu_student.student_id
  name: '123', // sys_user.real_name（真实姓名）
  studentNo: '242131306', // edu_student.student_no（学号）
  gender: 'MALE', // sys_user.gender ENUM('MALE','FEMALE','UNKNOWN')
  phone: '151****xxxx', // sys_user.phone VARCHAR(11)
  email: 'zhangsan@example.com', // sys_user.email VARCHAR(50)（测试邮箱）
  avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png', // sys_user.avatar VARCHAR(100)
  units: [
    // TODO: 后续需要关联 sys_dept 表获取单位信息
    { name: '贵州大学', workNo: '220070xxx' },
    { name: '贵州大学就业平台', workNo: '220070xxx' },
    { name: '贵州大学图书馆', workNo: '220070xxx' },
  ],
});

// 密码表单
const passwordForm = ref({
  oldPassword: '', // 当前密码（用于验证）
  newPassword: '', // 新密码
  confirmPassword: '', // 确认新密码
});

// 设置表单
const settingsForm = ref({
  language: 'zh-CN', // sys_user.learning_preference（学习偏好设置）
  courseNotification: true, // sys_user.notification_settings（通知设置）
  showProgress: true, // sys_user.privacy_settings（隐私设置）
});

// 从 sessionStorage 加载用户信息
onMounted(() => {
  const userStr = sessionStorage.getItem('currentUser');
  if (userStr) {
    try {
      const data = JSON.parse(userStr);
      userInfo.value.user_id = data.userId || null;
      userInfo.value.student_id = data.studentId || null;
      userInfo.value.name = data.name || '123';
      userInfo.value.studentNo = data.username || '242131306'; // 临时使用 username 作为学号
      // 使用与侧边栏、顶栏相同的默认头像
      userInfo.value.avatar =
        data.avatar ||
        'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png';
    } catch (e) {
      console.error('解析用户信息失败', e);
    }
  }
});
// ==================== 🔴 模拟数据 END ====================

// 处理头像更改
const handleAvatarChange = file => {
  const reader = new FileReader();
  reader.onload = e => {
    userInfo.value.avatar = e.target.result;
    ElMessage.success('头像已更新（仅预览，需保存）');
  };
  reader.readAsDataURL(file.raw);
};

// 添加单位
const handleAddUnit = () => {
  ElMessage.info('添加单位功能开发中');
};

// 保存资料
const saveProfile = () => {
  ElMessage.success('资料已保存！');
  // TODO: 调用API保存用户信息
  // await updateUserProfile(userInfo.value);
};

// 修改密码
const changePassword = () => {
  if (!passwordForm.value.oldPassword) {
    ElMessage.warning('请输入当前密码');
    return;
  }
  if (!passwordForm.value.newPassword) {
    ElMessage.warning('请输入新密码');
    return;
  }
  if (passwordForm.value.newPassword.length < 6) {
    ElMessage.warning('新密码长度不能少于6位');
    return;
  }
  if (passwordForm.value.newPassword.length > 20) {
    ElMessage.warning('新密码长度不能超过20位');
    return;
  }
  if (passwordForm.value.newPassword !== passwordForm.value.confirmPassword) {
    ElMessage.error('两次输入的密码不一致');
    return;
  }
  ElMessage.success('密码修改成功！');
  // TODO: 调用API修改密码
  // await changeUserPassword(passwordForm.value);

  // 清空表单
  passwordForm.value = {
    oldPassword: '',
    newPassword: '',
    confirmPassword: '',
  };
};

// 注销账号
const handleDeleteAccount = () => {
  ElMessageBox.confirm('确定要注销账号吗？此操作不可恢复！', '危险操作', {
    confirmButtonText: '确定注销',
    cancelButtonText: '取消',
    type: 'error',
  })
    .then(() => {
      ElMessage.warning('账号注销功能暂未开放，请联系管理员');
    })
    .catch(() => {
      // 取消
    });
};
</script>

<style scoped>
/* 应用独立的、自给自足的全屏 Flexbox 布局 */
.profile-page {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  background: #fafafa;
}

.topbar {
  background: #fff;
  border-bottom: 1px solid #e5e7eb;
  padding: 14px 24px;
  display: flex;
  align-items: center;
  flex-shrink: 0;
}

.breadcrumb {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #6b7280;
  font-size: 13px;
}

.breadcrumb a {
  color: #6b7280;
  text-decoration: none;
  padding: 4px 8px;
  border-radius: 6px;
  transition: all 0.3s;
  cursor: pointer;
}

.breadcrumb a:hover {
  color: #3b82f6;
  background: rgba(59, 130, 246, 0.08);
}

.breadcrumb .current {
  color: #10b981;
  font-weight: 500;
}

.content {
  flex: 1;
  background: #ffffff;
  padding: 20px 24px;
  overflow-y: auto;
  min-height: 0;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  margin: 20px; /* 与 topbar 的间距 */
}

.custom-tabs {
  display: flex;
  gap: 10px;
}

.tab-item {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 16px;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.3s;
  color: #6b7280;
  font-weight: 500;
  font-size: 14px;
  border: 1px solid transparent;
}

.tab-item:hover {
  color: #3b82f6;
  background: rgba(59, 130, 246, 0.08);
}

.tab-item.active {
  color: #3b82f6;
  background: #eef2ff; /* 淡蓝色背景 */
  border-color: transparent; /* 无边框 */
  font-weight: 600;
}

.tab-item .el-icon {
  font-size: 20px;
}

.panel {
  background: transparent; /* 面板背景透明 */
  border: none; /* 移除面板边框 */
  padding: 0; /* 移除面板内边距 */
  margin-bottom: 0; /* 移除面板外边距 */
  border-radius: 0;
}

.panel-title {
  font-size: 16px;
  font-weight: 600;
  color: #1f2937;
  margin-bottom: 20px;
}

/* 头像设置 */
/* 左右布局容器 */
.profile-layout {
  display: grid;
  grid-template-columns: 280px 1fr;
  gap: 24px;
  align-items: start;
}

/* 左侧头像卡片 */
.avatar-card {
  background: #f9fafb;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  padding: 24px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16px;
  text-align: center;
}

.avatar-info {
  width: 100%;
}

.avatar-info h4 {
  font-size: 14px;
  font-weight: 600;
  color: #1f2937;
  margin: 0 0 8px 0;
}

.avatar-info p {
  font-size: 12px;
  color: #6b7280;
  margin: 0;
  line-height: 1.6;
}

/* 右侧表单卡片 */
.form-card {
  background: #ffffff;
  flex: 1;
}

/* 表单行（两列布局） */
.form-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}

.form-row .el-form-item {
  margin-bottom: 18px;
}

/* 单位列表 */
.units-list {
  background: #f9fafb;
  border-radius: 8px;
  padding: 12px;
  width: 100%;
}

.unit-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 0;
  border-bottom: 1px solid #e5e7eb;
}

.unit-item:last-child {
  border-bottom: none;
}

.unit-name {
  font-weight: 500;
  color: #1f2937;
  font-size: 14px;
}

.unit-id {
  font-size: 12px;
  color: #6b7280;
  margin-top: 2px;
}

/* 学习数据统计 */
.metrics-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 12px;
  margin-bottom: 16px;
}

.metric-card {
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  padding: 16px;
  display: flex;
  align-items: center;
  gap: 12px;
  background: #ffffff;
  transition: all 0.3s;
}

.metric-card:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  border-color: #d1d5db;
}

.ring {
  width: 56px;
  height: 56px;
  border-radius: 50%;
  background: conic-gradient(#10b981 calc(var(--p) * 1%), #e5e7eb 0);
  display: grid;
  place-items: center;
  flex-shrink: 0;
  position: relative;
}

.ring span {
  background: #fff;
  border-radius: 50%;
  width: 42px;
  height: 42px;
  display: grid;
  place-items: center;
  font-weight: 600;
  font-size: 14px;
  color: #1f2937;
}

.metric-info {
  flex: 1;
  min-width: 0;
}

.metric-title {
  font-weight: 600;
  font-size: 15px;
  color: #1f2937;
  margin-bottom: 2px;
}

.metric-desc {
  color: #6b7280;
  font-size: 12px;
  margin-bottom: 4px;
}

.metric-badge {
  font-size: 11px;
  margin-top: 2px;
  display: inline-flex;
  align-items: center;
  gap: 4px;
}

.metric-badge.success {
  color: #10b981;
}

.metric-badge.success::before {
  content: '▲';
  font-size: 10px;
}

.metric-badge.warning {
  color: #ef4444;
}

.metric-badge.warning::before {
  content: '▲';
  font-size: 10px;
}

/* 成就徽章 */
.achievement-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 12px;
}

.achievement-item {
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  padding: 16px;
  display: flex;
  align-items: center;
  gap: 12px;
  transition: all 0.3s;
}

.achievement-item:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  border-color: #d1d5db;
}

.achievement-icon {
  width: 40px;
  height: 40px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  flex-shrink: 0;
  color: #ffffff;
}

.achievement-icon.primary {
  background: #3b82f6;
}

.achievement-icon.warning {
  background: #f59e0b;
}

.achievement-icon.success {
  background: #10b981;
}

.achievement-icon.info {
  background: #6366f1;
}

.achievement-info h5 {
  font-size: 14px;
  font-weight: 600;
  color: #1f2937;
  margin: 0 0 4px 0;
}

.achievement-info p {
  font-size: 12px;
  color: #6b7280;
  margin: 0;
}

/* 学习分析 */
.analysis-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

.analysis-box {
  padding: 16px;
  border-radius: 8px;
  border: 1px solid;
}

.analysis-box.success {
  background: #f0f9ff;
  border-color: #e0f2fe;
}

.analysis-box.warning {
  background: #fef3c7;
  border-color: #fde68a;
}

.analysis-box h4 {
  margin: 0 0 12px 0;
  font-size: 14px;
  font-weight: 600;
}

.analysis-box.success h4 {
  color: #22c55e;
}

.analysis-box.warning h4 {
  color: #f59e0b;
}

.analysis-box ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.analysis-box li {
  padding: 6px 0;
  color: #1f2937;
  font-size: 13px;
  line-height: 1.6;
  position: relative;
  padding-left: 16px;
}

.analysis-box li::before {
  content: '';
  position: absolute;
  left: 0;
  top: 12px;
  width: 4px;
  height: 4px;
  border-radius: 50%;
  background: currentColor;
}

.profile-form {
  max-width: 800px;
}

/* 响应式 */
@media (max-width: 1024px) {
  .profile-layout {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .avatar-card {
    max-width: 300px;
    margin: 0 auto;
  }

  .form-row {
    grid-template-columns: 1fr;
    gap: 0;
  }
}

@media (max-width: 768px) {
  .metrics-grid {
    grid-template-columns: 1fr;
  }

  .analysis-grid {
    grid-template-columns: 1fr;
  }

  .achievement-grid {
    grid-template-columns: 1fr;
  }

  .content {
    padding: 16px;
    margin: 16px;
  }
}
</style>
