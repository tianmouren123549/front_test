<template>
  <div
    :class="['sidebar-overlay', { show: isShow }]"
    @click="handleClick"
  ></div>
</template>

<script setup>
defineProps({
  isShow: {
    type: Boolean,
    default: false,
  },
});

const emit = defineEmits(['close']);

const handleClick = () => {
  emit('close');
};
</script>

<style scoped>
/* 使用全局公共样式，无需额外样式 */
</style>

