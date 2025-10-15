<template>
  <button
    v-show="!isOpen"
    :class="['menu-toggle', { 'menu-toggle-fixed': fixed }]"
    @click="handleClick"
  >
    <el-icon :size="20">
      <Expand />
    </el-icon>
  </button>
</template>

<script setup>
import { Expand } from '@element-plus/icons-vue';

defineProps({
  isOpen: {
    type: Boolean,
    default: false,
  },
  fixed: {
    type: Boolean,
    default: false,
  },
});

const emit = defineEmits(['toggle']);

const handleClick = () => {
  emit('toggle');
};
</script>

<style scoped>
/* 使用全局公共样式，只添加组件特定样式 */
.menu-toggle {
  flex-shrink: 0;
}
</style>

