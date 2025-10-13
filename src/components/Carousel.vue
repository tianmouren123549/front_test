<style scoped>
.carousel-container {
  position: fixed;
  top: var(--navbar-height);
  left: 0;
  width: 100vw;
  height: calc(100vh - var(--navbar-height));
  margin: 0;
  border-radius: 0;
  overflow: hidden;
  background: transparent;
  z-index: 1;
}

.carousel-slide-wrapper {
  position: relative;
  width: 100%;
  height: auto;
  transform: translateY(0);
  transition: transform var(--transition-slowest) var(--ease-in-out);
}

.carousel-item {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: calc(100vh - var(--navbar-height));
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  transition: all 0.8s var(--ease-in-out);
}

.carousel-item::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(
    90deg,
    rgba(0, 0, 0, 0.3) 0%,
    rgba(0, 0, 0, 0.1) 50%,
    transparent 100%
  );
  z-index: 1;
}

.carousel-content {
  position: absolute;
  left: 8%;
  top: 50%;
  transform: translateY(-50%);
  color: var(--white);
  z-index: 2;
  max-width: 600px;
  opacity: 1;
}

.carousel-title {
  font-size: var(--font-size-5xl);
  font-weight: var(--font-weight-bold);
  line-height: 1.1;
  margin-bottom: var(--spacing-xl);
  text-shadow:
    0 2px 8px rgba(0, 0, 0, 0.3),
    0 4px 20px rgba(0, 0, 0, 0.2);
  letter-spacing: -2px;
  opacity: 0;
  transform: translateY(30px);
  filter: blur(8px);
}

.carousel-description {
  font-size: var(--font-size-2xl);
  margin-bottom: var(--spacing-xxl);
  opacity: 0;
  line-height: 1.4;
  font-weight: var(--font-weight-medium);
  transform: translateY(30px);
  filter: blur(8px);
  text-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

.carousel-button {
  background: rgba(255, 255, 255, 0.95);
  color: var(--primary-color);
  border: 2px solid rgba(255, 255, 255, 0.3);
  padding: 16px 36px;
  border-radius: var(--radius-round);
  font-size: var(--font-size-lg);
  font-weight: var(--font-weight-semibold);
  cursor: pointer;
  transition: all var(--transition-slow) var(--ease-in-out);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  letter-spacing: 0.5px;
  position: relative;
  overflow: hidden;
  opacity: 0;
  transform: translateY(30px);
  filter: blur(8px);
  backdrop-filter: blur(10px);
}

.carousel-button::before {
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

.carousel-button:hover::before {
  left: 100%;
}

.carousel-button:hover {
  transform: translateY(-2px) scale(1.03);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
  background: rgba(255, 255, 255, 1);
  border-color: var(--primary-color);
}

.text-fade-in {
  animation: textFadeIn 0.6s var(--ease-in-out) forwards;
}

@keyframes textFadeIn {
  0% {
    opacity: 0;
    transform: translateY(30px);
    filter: blur(8px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
    filter: blur(0);
  }
}

.carousel-indicators {
  position: fixed;
  right: var(--spacing-xl);
  top: 50%;
  transform: translateY(-50%);
  z-index: 15;
  display: flex;
  flex-direction: column;
  gap: var(--spacing-md);
}

.carousel-indicator {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.5);
  cursor: pointer;
  transition: all var(--transition-slow) var(--ease-in-out);
  position: relative;
  border: 2px solid rgba(255, 255, 255, 0.3);
  backdrop-filter: blur(4px);
}

.carousel-indicator::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 0;
  height: 0;
  background: var(--primary-color);
  border-radius: 50%;
  transition: all var(--transition-slow) var(--ease-in-out);
}

.carousel-indicator:hover {
  background: rgba(255, 255, 255, 0.7);
  transform: scale(1.2);
}

.carousel-indicator.active {
  background: rgba(255, 255, 255, 0.95);
  border-color: rgba(255, 255, 255, 0.5);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  transform: scale(1.3);
}

.carousel-indicator.active::before {
  width: 5px;
  height: 5px;
  background: var(--primary-color);
}

/* 响应式设计 */
@media (max-width: 768px) {
  .carousel-container {
    top: var(--navbar-height-tablet);
    height: calc(100vh - var(--navbar-height-tablet));
  }

  .carousel-item {
    height: calc(100vh - var(--navbar-height-tablet));
  }

  .carousel-content {
    left: 40px;
    max-width: 400px;
  }

  .carousel-title {
    font-size: var(--font-size-4xl);
    margin-bottom: var(--spacing-lg);
  }

  .carousel-description {
    font-size: var(--font-size-lg);
    margin-bottom: var(--spacing-xl);
  }

  .carousel-button {
    padding: 14px 32px;
    font-size: var(--font-size-base);
  }

  .carousel-indicators {
    right: var(--spacing-lg);
    gap: 12px;
  }

  .carousel-indicator {
    width: 10px;
    height: 10px;
  }
}

@media (max-width: 480px) {
  .carousel-container {
    top: var(--navbar-height-mobile);
    height: calc(100vh - var(--navbar-height-mobile));
  }

  .carousel-item {
    height: calc(100vh - var(--navbar-height-mobile));
  }

  .carousel-content {
    left: var(--spacing-lg);
    max-width: 280px;
  }

  .carousel-title {
    font-size: var(--font-size-3xl);
    line-height: 1.2;
    margin-bottom: var(--spacing-md);
  }

  .carousel-description {
    font-size: var(--font-size-base);
    margin-bottom: 25px;
  }

  .carousel-button {
    padding: 12px 25px;
    font-size: var(--font-size-sm);
  }

  .carousel-indicators {
    right: var(--spacing-md);
    gap: var(--spacing-sm);
  }

  .carousel-indicator {
    width: 8px;
    height: 8px;
    border-width: 1px;
  }

  .carousel-indicator.active::before {
    width: 4px;
    height: 4px;
  }
}
</style>

<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue';

const props = defineProps({
  slides: {
    type: Array,
    required: true,
    default: () => [],
  },
  autoSlideInterval: {
    type: Number,
    default: 6000,
  },
});

const currentSlide = ref(0);
const isAnimating = ref(false);
const autoSlideTimer = ref(null);

const navbarHeight = computed(() => {
  const navbar = document.querySelector('.custom-navbar');
  return navbar ? navbar.offsetHeight : 75;
});

const slideHeight = computed(() => {
  return window.innerHeight - navbarHeight.value;
});

// 更新幻灯片位置
const updateSlidePositions = () => {
  const slideElements = document.querySelectorAll('.carousel-item');
  slideElements.forEach((slide, index) => {
    slide.style.top = `${index * slideHeight.value}px`;
  });
};

// 重置所有文字动画
const resetAllTextAnimations = () => {
  const slideElements = document.querySelectorAll('.carousel-item');
  slideElements.forEach(slide => {
    const textElements = slide.querySelectorAll(
      '.carousel-title, .carousel-description, .carousel-button'
    );
    textElements.forEach(element => {
      element.classList.remove('text-fade-in');
      element.style.opacity = '0';
      element.style.transform = 'translateY(30px)';
      element.style.filter = 'blur(8px)';
    });
  });
};

// 触发文字动画
const triggerTextAnimation = () => {
  const currentSlideElement =
    document.querySelectorAll('.carousel-item')[currentSlide.value];
  if (!currentSlideElement) return;

  const title = currentSlideElement.querySelector('.carousel-title');
  const description = currentSlideElement.querySelector(
    '.carousel-description'
  );
  const button = currentSlideElement.querySelector('.carousel-button');

  setTimeout(() => {
    if (title) title.classList.add('text-fade-in');
  }, 100);

  setTimeout(() => {
    if (description) description.classList.add('text-fade-in');
  }, 200);

  setTimeout(() => {
    if (button) button.classList.add('text-fade-in');
  }, 300);
};

// 更新幻灯片
const updateSlide = () => {
  isAnimating.value = true;
  resetAllTextAnimations();

  const wrapper = document.querySelector('.carousel-slide-wrapper');
  if (wrapper) {
    const translateY = -currentSlide.value * slideHeight.value;
    wrapper.style.transform = `translateY(${translateY}px)`;
  }

  setTimeout(() => {
    triggerTextAnimation();
    isAnimating.value = false;
  }, 1000);
};

// 下一张
const nextSlide = () => {
  if (isAnimating.value) return;
  // 如果已经是最后一张，停止自动播放并返回
  if (currentSlide.value >= props.slides.length - 1) {
    stopAutoSlide();
    return;
  }
  currentSlide.value++;
  updateSlide();
  resetAutoSlide();
};

// 上一张
const prevSlide = () => {
  if (isAnimating.value) return;
  // 如果已经是第一张，不允许向上
  if (currentSlide.value <= 0) return;
  currentSlide.value--;
  updateSlide();
  resetAutoSlide();
};

// 跳转到指定幻灯片
const goToSlide = index => {
  if (isAnimating.value || index === currentSlide.value) return;
  currentSlide.value = index;
  updateSlide();
  resetAutoSlide();
};

// 自动播放
const startAutoSlide = () => {
  stopAutoSlide();
  autoSlideTimer.value = setInterval(() => {
    nextSlide();
  }, props.autoSlideInterval);
};

const stopAutoSlide = () => {
  if (autoSlideTimer.value) {
    clearInterval(autoSlideTimer.value);
    autoSlideTimer.value = null;
  }
};

const resetAutoSlide = () => {
  stopAutoSlide();
  startAutoSlide();
};

// 滚轮事件
const handleWheel = e => {
  if (isAnimating.value) return;
  e.preventDefault();

  if (e.deltaY > 0) {
    nextSlide();
  } else {
    prevSlide();
  }
};

// 键盘事件
const handleKeydown = e => {
  if (e.key === 'ArrowUp' || e.key === 'PageUp') {
    e.preventDefault();
    prevSlide();
  }
  if (e.key === 'ArrowDown' || e.key === 'PageDown') {
    e.preventDefault();
    nextSlide();
  }
};

// 触摸事件
let touchStartY = 0;
let touchStartTime = 0;

const handleTouchStart = e => {
  touchStartY = e.touches[0].clientY;
  touchStartTime = Date.now();
};

const handleTouchEnd = e => {
  if (isAnimating.value) return;

  const touchEndY = e.changedTouches[0].clientY;
  const touchEndTime = Date.now();
  const diffY = touchStartY - touchEndY;
  const timeDiff = touchEndTime - touchStartTime;

  if (Math.abs(diffY) > 50 && timeDiff < 500) {
    if (diffY > 0) {
      nextSlide();
    } else {
      prevSlide();
    }
  }
};

// 窗口大小变化
const handleResize = () => {
  updateSlidePositions();
  updateSlide();
};

// 鼠标悬停暂停
const handleMouseEnter = () => {
  stopAutoSlide();
};

const handleMouseLeave = () => {
  startAutoSlide();
};

// 按钮点击
const handleButtonClick = index => {
  console.log(`幻灯片 ${index + 1} 的按钮被点击`);
  // 这里可以触发具体的跳转或操作
};

onMounted(() => {
  updateSlidePositions();
  updateSlide();
  startAutoSlide();

  // 绑定事件
  const container = document.querySelector('.carousel-container');
  if (container) {
    container.addEventListener('wheel', handleWheel, { passive: false });
    container.addEventListener('mouseenter', handleMouseEnter);
    container.addEventListener('mouseleave', handleMouseLeave);
    container.addEventListener('touchstart', handleTouchStart, {
      passive: true,
    });
    container.addEventListener('touchend', handleTouchEnd, { passive: true });
  }

  document.addEventListener('keydown', handleKeydown);
  window.addEventListener('resize', handleResize);

  // 初始动画
  setTimeout(() => {
    triggerTextAnimation();
  }, 500);
});

onUnmounted(() => {
  stopAutoSlide();

  // 移除事件监听
  const container = document.querySelector('.carousel-container');
  if (container) {
    container.removeEventListener('wheel', handleWheel);
    container.removeEventListener('mouseenter', handleMouseEnter);
    container.removeEventListener('mouseleave', handleMouseLeave);
    container.removeEventListener('touchstart', handleTouchStart);
    container.removeEventListener('touchend', handleTouchEnd);
  }

  document.removeEventListener('keydown', handleKeydown);
  window.removeEventListener('resize', handleResize);
});
</script>

<template>
  <div class="carousel-container">
    <div
      class="carousel-slide-wrapper"
      :style="{ height: `${slides.length * slideHeight}px` }"
    >
      <div
        v-for="(slide, index) in slides"
        :key="index"
        class="carousel-item"
        :style="{ backgroundImage: `url(${slide.image})` }"
      >
        <div
          v-if="slide.title || slide.description || slide.buttonText"
          class="carousel-content"
        >
          <div v-if="slide.title" class="carousel-title">{{ slide.title }}</div>
          <div v-if="slide.description" class="carousel-description">
            {{ slide.description }}
          </div>
          <button
            v-if="slide.buttonText"
            class="carousel-button"
            @click="handleButtonClick(index)"
          >
            {{ slide.buttonText }}
          </button>
        </div>
      </div>
    </div>

    <!-- 垂直指示器 -->
    <div class="carousel-indicators">
      <div
        v-for="(slide, index) in slides"
        :key="`indicator-${index}`"
        :class="['carousel-indicator', { active: index === currentSlide }]"
        @click="goToSlide(index)"
      ></div>
    </div>
  </div>
</template>
