<style scoped>
.login-page {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: linear-gradient(135deg, var(--gray-light) 0%, var(--gray) 100%);
  padding: var(--spacing-xl);
  position: relative;
}

/* 背景装饰 */
.login-page::before {
  content: '';
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: radial-gradient(
      circle at 20% 50%,
      rgba(30, 60, 114, 0.1) 0%,
      transparent 50%
    ),
    radial-gradient(
      circle at 80% 20%,
      rgba(42, 82, 152, 0.1) 0%,
      transparent 50%
    );
  pointer-events: none;
  z-index: 0;
}

.login-container {
  background: var(--white);
  padding: 50px 40px;
  border-radius: var(--radius-xl);
  box-shadow: var(--shadow-primary);
  width: 100%;
  max-width: 450px;
  position: relative;
  z-index: 1;
}

.login-header {
  text-align: center;
  margin-bottom: var(--spacing-xxl);
}

.login-header h1 {
  color: var(--primary-color);
  font-size: var(--font-size-3xl);
  margin-bottom: var(--spacing-md);
  font-weight: var(--font-weight-bold);
}

.login-header p {
  color: var(--gray-dark);
  font-size: var(--font-size-base);
}

/* 角色切换 */
.role-switch {
  display: flex;
  gap: var(--spacing-md);
  margin-bottom: var(--spacing-xxl);
  padding: 4px;
  background: var(--gray-light);
  border-radius: var(--radius-lg);
}

.role-btn {
  flex: 1;
  padding: 12px 20px;
  background: transparent;
  border: none;
  border-radius: var(--radius-md);
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-medium);
  color: var(--gray-dark);
  cursor: pointer;
  transition: all var(--transition-base);
}

.role-btn:hover {
  color: var(--primary-color);
}

.role-btn.active {
  background: var(--white);
  color: var(--primary-color);
  box-shadow: 0 2px 8px rgba(30, 60, 114, 0.15);
  font-weight: var(--font-weight-semibold);
}

/* 表单 */
.login-form {
  margin-bottom: var(--spacing-xl);
}

.form-options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: var(--spacing-xl);
}

.login-btn {
  width: 100%;
  font-size: var(--font-size-lg);
  font-weight: var(--font-weight-semibold);
  height: 48px;
  background: var(--primary-gradient);
  border: none;
}

.login-btn:hover {
  background: linear-gradient(
    45deg,
    var(--primary-dark),
    var(--secondary-dark)
  );
  transform: translateY(-2px);
  box-shadow: var(--shadow-primary);
}

.login-btn:active {
  transform: translateY(0);
}

/* 提示信息 */
.login-tips {
  margin-top: var(--spacing-xl);
  padding: var(--spacing-md);
  background: #f0f8ff;
  border-left: 3px solid var(--primary-color);
  font-size: var(--font-size-sm);
  color: var(--gray-dark);
  border-radius: var(--radius-sm);
  line-height: 1.6;
}

.login-tips strong {
  color: var(--primary-color);
}

/* 注册链接 */
.register-link {
  margin-top: var(--spacing-lg);
  text-align: center;
  color: var(--gray-dark);
  font-size: var(--font-size-sm);
}

.register-link .el-link {
  font-weight: var(--font-weight-semibold);
}

/* 返回首页 */
.back-home {
  margin-top: var(--spacing-xl);
  text-align: center;
}

/* 注册对话框 */
.register-dialog :deep(.el-dialog) {
  border-radius: var(--radius-xl);
  box-shadow: var(--shadow-primary);
}

.register-dialog :deep(.el-dialog__header) {
  padding: var(--spacing-xl) var(--spacing-xl) var(--spacing-md);
  border-bottom: 1px solid var(--gray-light);
}

.register-dialog :deep(.el-dialog__title) {
  color: var(--primary-color);
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-bold);
}

.register-dialog :deep(.el-dialog__body) {
  padding: var(--spacing-xl);
}

.register-dialog :deep(.el-form-item__label) {
  font-weight: var(--font-weight-medium);
}

.register-form-footer {
  display: flex;
  justify-content: center;
  gap: var(--spacing-md);
  margin-top: var(--spacing-xl);
}

.register-btn {
  min-width: 120px;
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-semibold);
  background: var(--primary-gradient);
  border: none;
}

.register-btn:hover {
  background: linear-gradient(
    45deg,
    var(--primary-dark),
    var(--secondary-dark)
  );
  transform: translateY(-2px);
  box-shadow: var(--shadow-primary);
}

.cancel-btn {
  min-width: 120px;
}

/* 响应式设计 */
@media (max-width: 480px) {
  .login-container {
    padding: var(--spacing-xxl) var(--spacing-lg);
  }

  .login-header h1 {
    font-size: var(--font-size-2xl);
  }

  .login-header p {
    font-size: var(--font-size-sm);
  }

  .role-btn {
    padding: 10px 16px;
    font-size: var(--font-size-sm);
  }

  .login-btn {
    height: 44px;
    font-size: var(--font-size-base);
  }
}
</style>

<script setup>
import { ref, computed } from 'vue';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';
import { User, Lock, ArrowLeft, Phone, Postcard } from '@element-plus/icons-vue';

const router = useRouter();

// 当前角色：student 或 teacher
const currentRole = ref('student'); // 默认显示学生端

// 登录表单
const loginFormRef = ref(null);
const loginForm = ref({
  username: '',
  password: '',
  remember: false,
});

// 加载状态
const loading = ref(false);

// 注册对话框
const registerDialogVisible = ref(false);
const registerFormRef = ref(null);
const registerForm = ref({
  username: '',
  name: '',
  phone: '',
  password: '',
  confirmPassword: '',
});

// 注册加载状态
const registerLoading = ref(false);

// 计算属性
const currentRoleText = computed(() => {
  return currentRole.value === 'student' ? '学生端' : '教师端';
});

const usernamePlaceholder = computed(() => {
  return currentRole.value === 'student' ? '请输入学号' : '请输入工号/用户名';
});

const registerUsernameLabel = computed(() => {
  return currentRole.value === 'student' ? '学号' : '工号';
});

const registerUsernamePlaceholder = computed(() => {
  return currentRole.value === 'student' ? '请输入学号' : '请输入工号';
});

// 表单验证规则
const loginRules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, message: '密码长度不能少于6位', trigger: 'blur' },
  ],
};

// 确认密码验证器
const validateConfirmPassword = (rule, value, callback) => {
  if (value === '') {
    callback(new Error('请再次输入密码'));
  } else if (value !== registerForm.value.password) {
    callback(new Error('两次输入的密码不一致'));
  } else {
    callback();
  }
};

// 注册表单验证规则
const registerRules = {
  username: [
    { required: true, message: '请输入' + registerUsernameLabel.value, trigger: 'blur' },
    { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' },
  ],
  name: [
    { required: true, message: '请输入姓名', trigger: 'blur' },
    { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' },
  ],
  phone: [
    { required: true, message: '请输入手机号', trigger: 'blur' },
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号', trigger: 'blur' },
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, max: 20, message: '密码长度在 6 到 20 个字符', trigger: 'blur' },
  ],
  confirmPassword: [
    { required: true, message: '请确认密码', trigger: 'blur' },
    { validator: validateConfirmPassword, trigger: 'blur' },
  ],
};

// 切换角色
const switchRole = role => {
  currentRole.value = role;
  // 清空表单
  loginForm.value.username = '';
  loginForm.value.password = '';
  loginFormRef.value?.clearValidate();
};

// 处理登录
const handleLogin = async () => {
  if (!loginFormRef.value) return;

  // 验证表单
  await loginFormRef.value.validate(valid => {
    if (!valid) return;

    loading.value = true;

    // ==================== 🔴 模拟登录流程 START ====================
    // TODO: 替换为真实的API调用
    // const response = await axios.post('/api/auth/login', {
    //   username: loginForm.value.username,
    //   password: loginForm.value.password,
    //   role: currentRole.value
    // });

    // 模拟登录验证（仅用于开发测试）
    setTimeout(() => {
      const { username, password, remember } = loginForm.value;

      let loginSuccess = false;
      let userName = '';

      // 学生端登录验证（模拟数据）
      if (currentRole.value === 'student') {
        if (username === '2024001' && password === '123456') {
          loginSuccess = true;
          userName = '张三';
        }
      }
      // 教师端登录验证（模拟数据）
      else {
        if (username === 'teacher001' && password === '123456') {
          loginSuccess = true;
          userName = '张老师';
        }
      }

      if (loginSuccess) {
        // 保存登录信息
        if (remember) {
          localStorage.setItem('rememberedUser', username);
          localStorage.setItem('rememberedRole', currentRole.value);
        }

        // 保存当前用户信息
        sessionStorage.setItem(
          'currentUser',
          JSON.stringify({
            username,
            name: userName,
            role: currentRole.value === 'student' ? '学生' : '教师',
            roleType: currentRole.value,
            loginTime: new Date().toLocaleString(),
          })
        );

        // 显示成功消息
        ElMessage.success({
          message: `欢迎您，${userName}！登录成功`,
          duration: 2000,
        });

        // 延迟跳转（根据角色跳转到对应的工作台）
        setTimeout(() => {
          loading.value = false;
          // 学生跳转到学生端，教师暂时跳转回首页（教师端待开发）
          if (currentRole.value === 'student') {
            router.push('/student');
          } else {
            router.push('/');
          }
        }, 1500);
      } else {
        loading.value = false;
        ElMessage.error('用户名或密码错误，请重试！');
        // 清空密码
        loginForm.value.password = '';
      }
    }, 1000);
    // ==================== 🔴 模拟登录流程 END ====================
  });
};

// 忘记密码
const handleForgotPassword = () => {
  ElMessage.info({
    message: '请联系系统管理员重置密码\n管理员电话：010-12345678',
    duration: 3000,
  });
};

// 返回首页
const goHome = () => {
  router.push('/');
};

// 打开注册对话框
const openRegisterDialog = () => {
  registerDialogVisible.value = true;
  // 清空注册表单
  registerForm.value = {
    username: '',
    name: '',
    phone: '',
    password: '',
    confirmPassword: '',
  };
  registerFormRef.value?.clearValidate();
};

// 关闭注册对话框
const closeRegisterDialog = () => {
  registerDialogVisible.value = false;
  registerFormRef.value?.resetFields();
};

// 处理注册
const handleRegister = async () => {
  if (!registerFormRef.value) return;

  await registerFormRef.value.validate(valid => {
    if (!valid) return;

    registerLoading.value = true;

    // ==================== 🔴 模拟注册流程 START ====================
    // TODO: 替换为真实的API调用
    // const response = await axios.post('/api/auth/register', {
    //   username: registerForm.value.username,
    //   name: registerForm.value.name,
    //   phone: registerForm.value.phone,
    //   password: registerForm.value.password,
    //   role: currentRole.value
    // });

    // 模拟注册请求（仅用于开发测试）
    setTimeout(() => {
      registerLoading.value = false;

      ElMessage.success({
        message: '注册成功！请使用新账号登录',
        duration: 3000,
      });

      // 关闭注册对话框
      closeRegisterDialog();

      // 自动填充登录表单
      loginForm.value.username = registerForm.value.username;
      loginForm.value.password = '';
    }, 1500);
    // ==================== 🔴 模拟注册流程 END ====================
  });
};

// 页面加载时检查记住的用户名
const rememberedUser = localStorage.getItem('rememberedUser');
const rememberedRole = localStorage.getItem('rememberedRole');
if (rememberedUser && rememberedRole) {
  currentRole.value = rememberedRole;
  loginForm.value.username = rememberedUser;
  loginForm.value.remember = true;
}
</script>

<template>
  <div class="login-page">
    <div class="login-container">
      <!-- 登录头部 -->
      <div class="login-header">
        <h1>🎓 智慧教学管理系统</h1>
        <p>基于AIGC的融合高校智慧教学平台 - {{ currentRoleText }}</p>
      </div>

      <!-- 角色切换 -->
      <div class="role-switch">
        <button
          :class="['role-btn', { active: currentRole === 'student' }]"
          @click="switchRole('student')"
        >
          学生端
        </button>

        <button
          :class="['role-btn', { active: currentRole === 'teacher' }]"
          @click="switchRole('teacher')"
        >
          教师端
        </button>
      </div>

      <!-- 登录表单 -->
      <el-form
        ref="loginFormRef"
        :model="loginForm"
        :rules="loginRules"
        class="login-form"
      >
        <!-- 用户名输入 -->
        <el-form-item prop="username">
          <el-input
            v-model="loginForm.username"
            :placeholder="usernamePlaceholder"
            size="large"
            clearable
          >
            <template #prefix>
              <el-icon><User /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <!-- 密码输入 -->
        <el-form-item prop="password">
          <el-input
            v-model="loginForm.password"
            type="password"
            placeholder="请输入密码"
            size="large"
            show-password
            @keyup.enter="handleLogin"
          >
            <template #prefix>
              <el-icon><Lock /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <!-- 选项区域 -->
        <div class="form-options">
          <el-checkbox v-model="loginForm.remember">记住密码</el-checkbox>
          <el-link type="primary" @click="handleForgotPassword">
            忘记密码？
          </el-link>
        </div>

        <!-- 登录按钮 -->
        <el-button
          type="primary"
          size="large"
          class="login-btn"
          :loading="loading"
          @click="handleLogin"
        >
          登 录
        </el-button>
      </el-form>

      <!-- 提示信息 -->
      <div class="login-tips">
        <strong>测试账号：</strong><br />
        <template v-if="currentRole === 'student'">
          学号：2024001 | 密码：123456
        </template>
        <template v-else> 工号：teacher001 | 密码：123456 </template>
      </div>

      <!-- 注册链接 -->
      <div class="register-link">
        还没有账号？
        <el-link type="primary" @click="openRegisterDialog">立即注册</el-link>
      </div>

      <!-- 返回首页 -->
      <div class="back-home">
        <el-link type="info" @click="goHome">
          <el-icon><ArrowLeft /></el-icon>
          返回首页
        </el-link>
      </div>
    </div>

    <!-- 注册对话框 -->
    <el-dialog
      v-model="registerDialogVisible"
      :title="`注册${currentRoleText}账号`"
      width="500px"
      class="register-dialog"
      :close-on-click-modal="false"
    >
      <el-form
        ref="registerFormRef"
        :model="registerForm"
        :rules="registerRules"
        label-width="100px"
      >
        <!-- 学号/工号 -->
        <el-form-item :label="registerUsernameLabel" prop="username">
          <el-input
            v-model="registerForm.username"
            :placeholder="registerUsernamePlaceholder"
            size="large"
            clearable
          >
            <template #prefix>
              <el-icon><Postcard /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <!-- 姓名 -->
        <el-form-item label="姓名" prop="name">
          <el-input
            v-model="registerForm.name"
            placeholder="请输入姓名"
            size="large"
            clearable
          >
            <template #prefix>
              <el-icon><User /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <!-- 手机号 -->
        <el-form-item label="手机号" prop="phone">
          <el-input
            v-model="registerForm.phone"
            placeholder="请输入手机号"
            size="large"
            clearable
            maxlength="11"
          >
            <template #prefix>
              <el-icon><Phone /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <!-- 密码 -->
        <el-form-item label="密码" prop="password">
          <el-input
            v-model="registerForm.password"
            type="password"
            placeholder="请输入密码（6-20位）"
            size="large"
            show-password
          >
            <template #prefix>
              <el-icon><Lock /></el-icon>
            </template>
          </el-input>
        </el-form-item>

        <!-- 确认密码 -->
        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input
            v-model="registerForm.confirmPassword"
            type="password"
            placeholder="请再次输入密码"
            size="large"
            show-password
            @keyup.enter="handleRegister"
          >
            <template #prefix>
              <el-icon><Lock /></el-icon>
            </template>
          </el-input>
        </el-form-item>
      </el-form>

      <!-- 对话框底部按钮 -->
      <template #footer>
        <div class="register-form-footer">
          <el-button class="cancel-btn" size="large" @click="closeRegisterDialog">
            取消
          </el-button>
          <el-button
            type="primary"
            size="large"
            class="register-btn"
            :loading="registerLoading"
            @click="handleRegister"
          >
            注册
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>
