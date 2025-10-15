<style scoped>
.forgot-password-page {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: linear-gradient(135deg, var(--gray-light) 0%, var(--gray) 100%);
  padding: var(--spacing-xl);
  position: relative;
}

/* 背景装饰 */
.forgot-password-page::before {
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

.forgot-password-container {
  background: var(--white);
  padding: 50px 40px;
  border-radius: var(--radius-xl);
  box-shadow: var(--shadow-primary);
  width: 100%;
  max-width: 450px;
  position: relative;
  z-index: 1;
}

.forgot-password-header {
  text-align: center;
  margin-bottom: var(--spacing-xxl);
}

.forgot-password-header h1 {
  color: var(--primary-color);
  font-size: var(--font-size-3xl);
  margin-bottom: var(--spacing-md);
  font-weight: var(--font-weight-bold);
}

.forgot-password-header p {
  color: var(--gray-dark);
  font-size: var(--font-size-base);
  line-height: 1.6;
}

/* 验证方式切换 */
.role-switch {
  display: flex;
  gap: var(--spacing-md);
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

/* 步骤指示器 */
.step-indicator {
  display: flex;
  justify-content: center;
  gap: var(--spacing-lg);
  margin-bottom: var(--spacing-xxl);
}

.step {
  display: flex;
  align-items: center;
  gap: var(--spacing-sm);
}

.step-number {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: #e5e7eb;
  color: #6b7280;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: var(--font-size-sm);
  font-weight: var(--font-weight-semibold);
  transition: all 0.3s;
}

.step.active .step-number {
  background: var(--primary-color);
  color: var(--white);
}

.step.completed .step-number {
  background: #10b981;
  color: var(--white);
}

.step-label {
  font-size: var(--font-size-sm);
  color: #6b7280;
  font-weight: var(--font-weight-medium);
}

.step.active .step-label {
  color: var(--primary-color);
}

.step-separator {
  width: 40px;
  height: 2px;
  background: #e5e7eb;
  margin: 0 var(--spacing-xs);
}

/* 表单 */
.forgot-password-form {
  margin-bottom: var(--spacing-xl);
}

.form-tip {
  margin-bottom: var(--spacing-lg);
  padding: var(--spacing-md);
  background: #f0f9ff;
  border-left: 3px solid var(--primary-color);
  border-radius: var(--radius-sm);
  font-size: var(--font-size-sm);
  color: var(--gray-dark);
  line-height: 1.6;
}

/* 统一按钮样式 - 按压效果 */
.step-btn {
  min-width: 120px;
  height: 48px;
  font-size: var(--font-size-lg);
  font-weight: var(--font-weight-semibold);
  background: var(--primary-color);
  color: var(--white);
  border: none;
  padding: 12px 20px;
  border-radius: var(--radius-md);
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(30, 60, 114, 0.2);
  transition: all 0.15s ease;
  position: relative;
}

.step-btn:hover {
  background: var(--primary-color);
  box-shadow: 0 2px 4px rgba(30, 60, 114, 0.3);
  transform: translateY(2px);
}

.step-btn:active {
  background: var(--primary-dark);
  box-shadow: 0 1px 2px rgba(30, 60, 114, 0.2);
  transform: translateY(4px);
}

/* 单独的按钮全宽 */
.forgot-password-form > .step-btn {
  width: 100%;
}

/* 按钮组容器 */
.button-group {
  display: flex;
  gap: 12px;
  width: 100%;
}

.button-group .step-btn {
  flex: 1;
  min-width: 0;
}

/* 返回登录 */
.back-login {
  margin-top: var(--spacing-xl);
  text-align: center;
}

.success-message {
  text-align: center;
  padding: var(--spacing-xxl) 0;
}

.success-icon {
  font-size: 64px;
  color: #10b981;
  margin-bottom: var(--spacing-lg);
}

.success-message h2 {
  color: #1f2937;
  font-size: var(--font-size-2xl);
  font-weight: var(--font-weight-bold);
  margin-bottom: var(--spacing-md);
}

.success-message p {
  color: var(--gray-dark);
  font-size: var(--font-size-base);
  line-height: 1.6;
  margin-bottom: var(--spacing-xl);
}

.success-message .step-btn {
  width: 100%;
  max-width: 300px;
  margin: 0 auto;
  display: block;
}

/* 响应式设计 */
@media (max-width: 480px) {
  .forgot-password-container {
    padding: var(--spacing-xxl) var(--spacing-lg);
  }

  .forgot-password-header h1 {
    font-size: var(--font-size-2xl);
  }

  .step-indicator {
    gap: var(--spacing-sm);
  }

  .step-label {
    display: none;
  }

  .step-separator {
    width: 20px;
  }

  .step-btn {
    height: 44px;
    font-size: var(--font-size-base);
  }
}
</style>

<script setup>
import { ref, computed } from 'vue';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';
import {
  User,
  Message,
  Lock,
  ArrowLeft,
  SuccessFilled,
} from '@element-plus/icons-vue';

const router = useRouter();

// 当前步骤：1-输入账号 2-验证身份 3-重置密码 4-完成
const currentStep = ref(1);

// 表单引用
const step1FormRef = ref(null);
const step2FormRef = ref(null);
const step3FormRef = ref(null);

// 步骤1：输入账号
const step1Form = ref({
  username: '',
});

// 步骤2：验证身份
const step2Form = ref({
  verificationType: 'email', // email 或 phone
  email: '',
  phone: '',
});

// 步骤3：重置密码
const step3Form = ref({
  newPassword: '',
  confirmPassword: '',
});

// 加载状态
const loading = ref(false);

// 步骤1验证规则
const step1Rules = {
  username: [{ required: true, message: '请输入学号/工号', trigger: 'blur' }],
};

// 步骤2验证规则
const step2Rules = computed(() => {
  if (step2Form.value.verificationType === 'email') {
    return {
      email: [{ required: true, message: '请输入邮箱', trigger: 'blur' }],
    };
  } else {
    return {
      phone: [{ required: true, message: '请输入手机号', trigger: 'blur' }],
    };
  }
});

// 确认密码验证器
const validateConfirmPassword = (rule, value, callback) => {
  if (value === '') {
    callback(new Error('请再次输入密码'));
  } else if (value !== step3Form.value.newPassword) {
    callback(new Error('两次输入的密码不一致'));
  } else {
    callback();
  }
};

// 步骤3验证规则
const step3Rules = {
  newPassword: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
    { min: 6, max: 20, message: '密码长度在 6 到 20 个字符', trigger: 'blur' },
  ],
  confirmPassword: [
    { required: true, message: '请确认密码', trigger: 'blur' },
    { validator: validateConfirmPassword, trigger: 'blur' },
  ],
};

// 处理步骤1提交
const handleStep1Submit = async () => {
  if (!step1FormRef.value) return;

  await step1FormRef.value.validate(valid => {
    if (!valid) return;

    loading.value = true;

    // ==================== 🔴 模拟验证用户 START ====================
    // TODO: 调用后端API验证用户是否存在
    // const response = await axios.post('/api/auth/check-user', {
    //   username: step1Form.value.username
    // });

    setTimeout(() => {
      loading.value = false;

      // 模拟验证成功
      if (step1Form.value.username) {
        ElMessage.success('用户验证成功，请继续验证身份');
        currentStep.value = 2;
      } else {
        ElMessage.error('用户不存在，请检查学号/工号');
      }
    }, 1000);
    // ==================== 🔴 模拟验证用户 END ====================
  });
};

// 切换验证方式
const switchVerificationType = type => {
  step2Form.value.verificationType = type;
  step2Form.value.email = '';
  step2Form.value.phone = '';
  step2FormRef.value?.clearValidate();
};

// 处理步骤2提交
const handleStep2Submit = async () => {
  if (!step2FormRef.value) return;

  await step2FormRef.value.validate(valid => {
    if (!valid) return;

    loading.value = true;

    // ==================== 🔴 模拟验证身份 START ====================
    // TODO: 调用后端API验证手机号或邮箱是否匹配
    // const response = await axios.post('/api/auth/verify-identity', {
    //   username: step1Form.value.username,
    //   verificationType: step2Form.value.verificationType,
    //   email: step2Form.value.email,
    //   phone: step2Form.value.phone
    // });

    setTimeout(() => {
      loading.value = false;
      ElMessage.success('身份验证成功，请设置新密码');
      currentStep.value = 3;
    }, 1000);
    // ==================== 🔴 模拟验证身份 END ====================
  });
};

// 处理步骤3提交
const handleStep3Submit = async () => {
  if (!step3FormRef.value) return;

  await step3FormRef.value.validate(valid => {
    if (!valid) return;

    loading.value = true;

    // ==================== 🔴 模拟重置密码 START ====================
    // TODO: 调用后端API重置密码
    // const response = await axios.post('/api/auth/reset-password', {
    //   username: step1Form.value.username,
    //   newPassword: step3Form.value.newPassword
    // });

    setTimeout(() => {
      loading.value = false;

      ElMessage.success('密码重置成功！');
      currentStep.value = 4;

      // 3秒后自动跳转到登录页
      setTimeout(() => {
        router.push('/login');
      }, 3000);
    }, 1000);
    // ==================== 🔴 模拟重置密码 END ====================
  });
};

// 返回上一步
const goBack = () => {
  if (currentStep.value > 1) {
    currentStep.value--;
  }
};

// 返回登录
const goToLogin = () => {
  router.push('/login');
};
</script>

<template>
  <div class="forgot-password-page">
    <div class="forgot-password-container">
      <!-- 头部 -->
      <div class="forgot-password-header">
        <h1>🔐 找回密码</h1>
        <p>请按照以下步骤重置您的密码</p>
      </div>

      <!-- 步骤指示器 -->
      <div class="step-indicator">
        <div
          :class="[
            'step',
            { active: currentStep === 1, completed: currentStep > 1 },
          ]"
        >
          <div class="step-number">1</div>
          <span class="step-label">输入账号</span>
        </div>
        <div class="step-separator"></div>
        <div
          :class="[
            'step',
            { active: currentStep === 2, completed: currentStep > 2 },
          ]"
        >
          <div class="step-number">2</div>
          <span class="step-label">验证身份</span>
        </div>
        <div class="step-separator"></div>
        <div
          :class="[
            'step',
            { active: currentStep === 3, completed: currentStep > 3 },
          ]"
        >
          <div class="step-number">3</div>
          <span class="step-label">重置密码</span>
        </div>
      </div>

      <!-- 步骤1：输入账号 -->
      <div v-if="currentStep === 1">
        <el-form
          ref="step1FormRef"
          :model="step1Form"
          :rules="step1Rules"
          class="forgot-password-form"
        >
          <div class="form-tip">请输入您的学号或工号，我们将验证您的身份</div>

          <el-form-item prop="username">
            <el-input
              v-model="step1Form.username"
              placeholder="请输入学号/工号"
              size="large"
              clearable
            >
              <template #prefix>
                <el-icon><User /></el-icon>
              </template>
            </el-input>
          </el-form-item>

          <el-button
            type="primary"
            size="large"
            class="step-btn"
            :loading="loading"
            @click="handleStep1Submit"
          >
            下一步
          </el-button>
        </el-form>
      </div>

      <!-- 步骤2：验证身份 -->
      <div v-if="currentStep === 2">
        <div class="form-tip" style="margin-bottom: var(--spacing-lg)">
          请选择验证方式，并输入您注册时使用的信息
        </div>

        <!-- 验证方式选择 -->
        <div class="role-switch" style="margin-bottom: var(--spacing-lg)">
          <button
            :class="[
              'role-btn',
              { active: step2Form.verificationType === 'email' },
            ]"
            @click="switchVerificationType('email')"
          >
            邮箱验证
          </button>
          <button
            :class="[
              'role-btn',
              { active: step2Form.verificationType === 'phone' },
            ]"
            @click="switchVerificationType('phone')"
          >
            手机验证
          </button>
        </div>

        <el-form
          ref="step2FormRef"
          :model="step2Form"
          :rules="step2Rules"
          class="forgot-password-form"
        >
          <!-- 邮箱验证 -->
          <template v-if="step2Form.verificationType === 'email'">
            <el-form-item prop="email">
              <el-input
                v-model="step2Form.email"
                placeholder="请输入注册时使用的邮箱"
                size="large"
                clearable
              >
                <template #prefix>
                  <el-icon><Message /></el-icon>
                </template>
              </el-input>
            </el-form-item>
          </template>

          <!-- 手机验证 -->
          <template v-if="step2Form.verificationType === 'phone'">
            <el-form-item prop="phone">
              <el-input
                v-model="step2Form.phone"
                placeholder="请输入注册时使用的手机号"
                size="large"
                maxlength="11"
                clearable
              >
                <template #prefix>
                  <el-icon><User /></el-icon>
                </template>
              </el-input>
            </el-form-item>
          </template>

          <div class="button-group">
            <el-button
              type="primary"
              size="large"
              class="step-btn"
              @click="goBack"
            >
              上一步
            </el-button>
            <el-button
              type="primary"
              size="large"
              class="step-btn"
              :loading="loading"
              @click="handleStep2Submit"
            >
              下一步
            </el-button>
          </div>
        </el-form>
      </div>

      <!-- 步骤3：重置密码 -->
      <div v-if="currentStep === 3">
        <el-form
          ref="step3FormRef"
          :model="step3Form"
          :rules="step3Rules"
          class="forgot-password-form"
        >
          <div class="form-tip">请设置新密码，密码长度为 6-20 个字符</div>

          <el-form-item prop="newPassword">
            <el-input
              v-model="step3Form.newPassword"
              type="password"
              placeholder="请输入新密码"
              size="large"
              show-password
            >
              <template #prefix>
                <el-icon><Lock /></el-icon>
              </template>
            </el-input>
          </el-form-item>

          <el-form-item prop="confirmPassword">
            <el-input
              v-model="step3Form.confirmPassword"
              type="password"
              placeholder="请再次输入新密码"
              size="large"
              show-password
              @keyup.enter="handleStep3Submit"
            >
              <template #prefix>
                <el-icon><Lock /></el-icon>
              </template>
            </el-input>
          </el-form-item>

          <div class="button-group">
            <el-button
              type="primary"
              size="large"
              class="step-btn"
              @click="goBack"
            >
              上一步
            </el-button>
            <el-button
              type="primary"
              size="large"
              class="step-btn"
              :loading="loading"
              @click="handleStep3Submit"
            >
              完成
            </el-button>
          </div>
        </el-form>
      </div>

      <!-- 步骤4：完成 -->
      <div v-if="currentStep === 4" class="success-message">
        <div class="success-icon">
          <el-icon><SuccessFilled /></el-icon>
        </div>
        <h2>密码重置成功！</h2>
        <p>您的密码已成功重置<br />即将跳转到登录页面...</p>
        <el-button
          type="primary"
          size="large"
          class="step-btn"
          @click="goToLogin"
        >
          立即登录
        </el-button>
      </div>

      <!-- 返回登录 -->
      <div v-if="currentStep < 4" class="back-login">
        <el-link type="info" @click="goToLogin">
          <el-icon><ArrowLeft /></el-icon>
          返回登录
        </el-link>
      </div>
    </div>
  </div>
</template>
