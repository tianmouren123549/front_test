<style scoped>
.custom-navbar {
  background: rgba(255, 255, 255, 0.9);
  padding: 0;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: var(--z-index-navbar);
  height: var(--navbar-height);
  backdrop-filter: blur(20px);
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.navbar-container {
  width: 100%;
  margin: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 var(--spacing-xl);
  height: 100%;
  position: relative;
}

.navbar-left {
  display: flex;
  align-items: center;
  gap: var(--spacing-lg);
}

.navbar-logo {
  display: flex;
  align-items: center;
  color: #333;
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-bold);
  transition: all var(--transition-base) var(--ease-in-out);
  cursor: pointer;
  text-decoration: none;
}

.navbar-logo:hover {
  transform: scale(1.02);
}

.logo-icon {
  width: 40px;
  height: 40px;
  background: var(--accent-gradient);
  border-radius: var(--radius-md);
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: var(--spacing-md);
  font-size: var(--font-size-xl);
  color: var(--white);
  font-weight: var(--font-weight-bold);
  box-shadow: var(--shadow-accent);
  transition: all var(--transition-base) var(--ease-in-out);
}

.navbar-logo:hover .logo-icon {
  box-shadow: var(--shadow-accent-hover);
  transform: translateY(-1px);
}

.logo-text {
  color: #333;
  font-size: 19px;
  font-weight: var(--font-weight-semibold);
  letter-spacing: 0.5px;
}

.navbar-menu {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
  gap: var(--spacing-xs);
}

.navbar-menu-item {
  margin: 0;
  position: relative;
}

.navbar-link {
  color: #666;
  text-decoration: none;
  padding: 14px 24px;
  border-radius: var(--radius-lg);
  transition: all 0.3s var(--ease-in-out);
  font-size: var(--font-size-base);
  font-weight: var(--font-weight-medium);
  position: relative;
  letter-spacing: 0.3px;
  display: inline-block;
}

.navbar-link::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.03);
  border-radius: var(--radius-lg);
  opacity: 0;
  transition: opacity var(--transition-base) var(--ease-in-out);
  z-index: -1;
}

.navbar-link:hover::before {
  opacity: 1;
}

.navbar-link:hover,
.navbar-link.active {
  color: var(--primary-color);
  transform: translateY(-1px);
}

.navbar-link.active::after {
  content: '';
  position: absolute;
  bottom: 10px;
  left: 24px;
  right: 24px;
  height: 2px;
  background: var(--primary-color);
  border-radius: 2px;
}

.navbar-link:active {
  transform: translateY(-1px) scale(0.98);
}

.navbar-auth {
  display: flex;
  align-items: center;
  gap: var(--spacing-lg);
  position: relative;
  margin-right: var(--spacing-sm);
}

.navbar-login-btn {
  background: var(--accent-gradient);
  color: var(--white);
  border: none;
  padding: 10px 25px;
  border-radius: var(--radius-xl);
  font-size: var(--font-size-sm);
  font-weight: var(--font-weight-semibold);
  cursor: pointer;
  transition: all 0.35s var(--ease-in-out);
  box-shadow: var(--shadow-accent);
  letter-spacing: 0.3px;
  position: relative;
  overflow: hidden;
  border: 2px solid transparent;
  white-space: nowrap;
  min-width: 70px;
  text-align: center;
}

.navbar-login-btn::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(
    90deg,
    transparent,
    rgba(255, 255, 255, 0.3),
    transparent
  );
  transition: left var(--transition-slower);
}

.navbar-login-btn:hover::before {
  left: 100%;
}

.navbar-login-btn:hover {
  background: linear-gradient(45deg, var(--accent-dark), var(--accent-darker));
  transform: translateY(-3px) scale(1.05);
  box-shadow: var(--shadow-accent-hover);
  border-color: var(--white-30);
}

.navbar-login-btn:active {
  transform: translateY(-1px) scale(1.02);
  box-shadow: var(--shadow-accent);
}

/* 移除导航栏装饰动画，保持简约 */

/* 响应式设计 */
@media (max-width: 768px) {
  .custom-navbar {
    height: var(--navbar-height-tablet);
  }

  .navbar-container {
    padding: 0 var(--spacing-lg);
  }

  .navbar-logo {
    font-size: 17px;
  }

  .logo-icon {
    width: 35px;
    height: 35px;
    font-size: var(--font-size-base);
    margin-right: 12px;
  }

  .logo-text {
    font-size: 17px;
  }

  .navbar-link {
    font-size: var(--font-size-sm);
    padding: 12px 18px;
  }
}

@media (max-width: 480px) {
  .custom-navbar {
    height: var(--navbar-height-mobile);
  }

  .navbar-container {
    padding: 0 var(--spacing-md);
  }

  .navbar-logo {
    font-size: var(--font-size-sm);
  }

  .logo-text {
    font-size: var(--font-size-sm);
  }

  .logo-icon {
    width: 32px;
    height: 32px;
    font-size: var(--font-size-sm);
  }

  .navbar-link {
    font-size: var(--font-size-sm);
    padding: 10px 16px;
  }

  .navbar-login-btn {
    padding: 8px 18px;
    font-size: var(--font-size-xs);
  }
}
</style>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续可能需要根据用户权限动态生成导航菜单
// API接口: GET /api/menu/navigation

const navLinks = ref([
  { name: '首页', path: '/', active: true },
  { name: '应用中心', path: '#', active: false },
]);
// ==================== 🔴 模拟数据 END ====================

const handleNavClick = index => {
  navLinks.value.forEach((link, i) => {
    link.active = i === index;
  });
  // 如果有路径且不是锚点，则进行路由跳转
  const link = navLinks.value[index];
  if (link.path && link.path !== '#') {
    router.push(link.path);
  }
};

const handleLogin = () => {
  router.push('/login');
};
</script>

<template>
  <nav class="custom-navbar">
    <div class="navbar-container">
      <div class="navbar-left">
        <div class="navbar-logo">
          <span class="logo-icon">∞</span>
          <span class="logo-text">北泽智慧教学平台</span>
        </div>
        <ul class="navbar-menu">
          <li
            v-for="(link, index) in navLinks"
            :key="index"
            class="navbar-menu-item"
          >
            <a
              href="#"
              :class="['navbar-link', { active: link.active }]"
              @click.prevent="handleNavClick(index)"
            >
              {{ link.name }}
            </a>
          </li>
        </ul>
      </div>
      <div class="navbar-auth">
        <button class="navbar-login-btn" @click="handleLogin">登录</button>
      </div>
    </div>
  </nav>
</template>
