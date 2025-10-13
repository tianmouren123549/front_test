import { defineConfig, globalIgnores } from 'eslint/config';
import globals from 'globals';
import js from '@eslint/js';
import pluginVue from 'eslint-plugin-vue';
import eslintPluginPrettier from 'eslint-plugin-prettier/recommended';

export default defineConfig([
  {
    name: 'app/files-to-lint',
    files: ['**/*.{js,mjs,jsx,vue}'],
  },

  globalIgnores(['**/dist/**', '**/dist-ssr/**', '**/coverage/**']),

  {
    languageOptions: {
      globals: {
        ...globals.browser,
      },
    },
  },

  js.configs.recommended,
  ...pluginVue.configs['flat/essential'],
  eslintPluginPrettier, // 集成 Prettier

  // 自定义规则
  {
    rules: {
      // 允许单个单词的组件名（如 Navbar, Carousel, Inbox, Login 等）
      'vue/multi-word-component-names': 'off',
    },
  },
]);
