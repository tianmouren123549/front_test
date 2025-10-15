<style scoped>
.course-detail {
  display: flex;
  min-height: 100vh;
  background: #f7f8fb;
}

.sidebar {
  width: 257px; /* 统一宽度 */
  background: #fff;
  border-right: 1px solid #e5e7eb;
  padding: 20px 16px; /* 统一内边距 */
  flex-shrink: 0;
  transition: transform 0.3s ease;
}

.brand {
  font-weight: 700;
  color: #64748b;
  font-size: 16px; /* 统一字体大小 */
  margin-bottom: 16px;
}

.sidebar-menu {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.menu-item {
  padding: 12px 14px; /* 统一内边距 */
  border-radius: 8px;
  color: #334155;
  cursor: pointer;
  transition: all 0.2s;
  font-size: 15px; /* 统一字体大小 */
  font-weight: 500; /* 统一字体粗细 */
}

.menu-item:hover {
  background: #f1f5f9;
}

.menu-item.active {
  background: #f1f5f9;
  color: var(--primary-color);
  font-weight: 600; /* 统一激活时粗细 */
}

.main-content {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.topbar {
  background: #fff;
  border-bottom: 1px solid #e5e7eb;
  padding: 14px 24px;
  display: flex;
  align-items: center;
  justify-content: space-between;
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
}

.breadcrumb a:hover {
  color: #3b82f6;
  background: rgba(59, 130, 246, 0.08);
}

.breadcrumb .current {
  color: #10b981;
  font-weight: 500;
}

.topbar-actions {
  display: flex;
  align-items: center;
  gap: 16px;
}

.content-area {
  padding: 20px 24px;
  overflow-y: auto;
}

.panel {
  background: #fff;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 20px;
}

.panel-title {
  font-weight: 600;
  font-size: 16px;
  margin-bottom: 16px;
  display: flex;
  align-items: center;
  gap: 8px;
}

.sub-tabs {
  display: flex;
  gap: 8px;
  margin-bottom: 20px;
}

.sub-tab {
  padding: 8px 16px;
  border: 1px solid #e5e7eb;
  background: #fff;
  border-radius: 8px;
  cursor: pointer;
  font-size: 14px;
  transition: all 0.2s;
}

.sub-tab.active {
  background: var(--primary-color);
  color: #fff;
  border-color: var(--primary-color);
}

/* 学习日志 */
.log-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px;
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  margin-bottom: 12px;
}

.log-date {
  width: 80px;
  color: #6b7280;
  font-size: 12px;
}

.log-card {
  flex: 1;
  background: #fafafa;
  padding: 10px;
  border-radius: 8px;
}

.log-time {
  font-size: 12px;
  color: #6b7280;
  margin-bottom: 4px;
}

.log-tag {
  display: inline-block;
  font-size: 11px;
  padding: 2px 6px;
  border-radius: 999px;
  background: #eef2ff;
  color: #3730a3;
  margin-bottom: 4px;
}

/* 学习画像 */
.knowledge-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 16px;
}

.knowledge-card {
  border-radius: 10px;
  padding: 14px;
  position: relative;
}

.knowledge-card.weak {
  background: linear-gradient(135deg, #fef2f2, #fee2e2);
  border: 1px solid #fecaca;
}

.knowledge-card.good {
  background: linear-gradient(135deg, #f0fdf4, #dcfce7);
  border: 1px solid #bbf7d0;
}

.knowledge-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 8px;
}

.knowledge-name {
  font-weight: 600;
  font-size: 14px;
}

.knowledge-badge {
  font-size: 10px;
  padding: 2px 6px;
  border-radius: 4px;
  color: #fff;
}

.progress-bar {
  width: 100%;
  height: 6px;
  background: #f1f5f9;
  border-radius: 3px;
  overflow: hidden;
  margin: 8px 0;
}

.progress-fill {
  height: 100%;
  transition: width 0.3s;
}

/* 错题记录 */
.wrong-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
}

.filter-buttons {
  display: flex;
  gap: 8px;
  margin-bottom: 16px;
}

.filter-btn {
  padding: 6px 12px;
  border: 1px solid #e5e7eb;
  background: #fff;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
  transition: all 0.2s;
}

.filter-btn.active {
  background: var(--primary-color);
  color: #fff;
  border-color: var(--primary-color);
}

.wrong-card {
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  padding: 12px;
  margin-bottom: 12px;
}

.wrong-question {
  font-weight: 600;
  margin-bottom: 6px;
}

.wrong-answer {
  color: #6b7280;
  font-size: 13px;
  margin: 4px 0;
}

.wrong-tip {
  color: #ef4444;
  font-size: 12px;
  margin-top: 6px;
}

/* 章节列表 */
.chapter-card {
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  padding: 16px;
  margin-bottom: 16px;
}

.chapter-header {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 12px;
}

.chapter-number {
  width: 40px;
  height: 40px;
  background: var(--primary-color);
  color: #fff;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 600;
  font-size: 14px;
}

.chapter-info {
  flex: 1;
}

.chapter-title {
  font-weight: 600;
  color: #1f2937;
  margin-bottom: 4px;
}

.chapter-meta {
  color: #6b7280;
  font-size: 13px;
}

.chapter-content {
  color: #4b5563;
  font-size: 14px;
  margin-bottom: 12px;
}

/* 作业/考试 */
.task-card {
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  padding: 12px;
  margin-bottom: 12px;
  cursor: pointer;
  transition: all 0.2s;
}

.task-card:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.task-row {
  display: flex;
  align-items: center;
  gap: 12px;
}

.task-icon {
  font-size: 20px;
}

.task-info {
  flex: 1;
}

.task-title {
  font-weight: 600;
  margin-bottom: 2px;
}

.task-time {
  color: #6b7280;
  font-size: 13px;
}

.task-status {
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
}

.status-pending {
  background: #fff7e6;
  color: #f59e0b;
}

.status-completed {
  background: #f0f9ff;
  color: #22c55e;
}

/* 汉堡菜单按钮和遮罩层样式继承自 components.css */

/* 遮罩层在课程详细页的特殊定位（PC端从侧边栏右边开始） */
.sidebar-overlay {
  left: var(--sidebar-width);
}

/* 响应式设计 */
@media (max-width: 860px) {
  .sidebar {
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    z-index: 1000; /* 提高层级，确保在遮罩上方 */
    transform: translateX(-100%);
    box-shadow: 2px 0 8px rgba(0, 0, 0, 0.1);
    overflow-y: auto; /* 添加滚动 */
  }

  .sidebar.mobile-open {
    transform: translateX(0);
  }

  .main-content {
    margin-left: 0;
    width: 100%;
  }

  .sidebar-overlay {
    left: 0; /* 移动端从左边开始，覆盖PC端的侧边栏右边定位 */
  }

  .topbar {
    padding-left: 70px;
  }
}

@media (max-width: 480px) {
  .topbar {
    padding: 12px 16px 12px 70px;
  }

  .content-area {
    padding: 16px;
  }

  .panel {
    padding: 16px;
  }
}
</style>

<script setup>
import { ref, computed } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import { ElMessage } from 'element-plus';
import MobileMenuToggle from '@/components/common/MobileMenuToggle.vue';
import SidebarOverlay from '@/components/common/SidebarOverlay.vue';

const router = useRouter();
const route = useRoute();

// 获取课程名称（从路由参数）
const courseName = computed(() => route.query.course || '课程名称');

// 当前激活的视图
const activeView = ref('learning');
const activeLearningTab = ref('log');
const activeTaskTab = ref('homework');

// 移动端侧边栏控制
const sidebarOpen = ref(false);

const toggleSidebar = () => {
  sidebarOpen.value = !sidebarOpen.value;
};

const closeSidebar = () => {
  sidebarOpen.value = false;
};

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API获取课程详情数据
// API接口: GET /api/course/detail?courseId=xxx
// 对应数据库表：stu_learning_record, edu_knowledge_point, stu_wrong_question, edu_course_chapter, eval_assignment, edu_exam_arrangement, analysis_score

// 学习日志数据
// 对应数据库表：stu_learning_record
const learningLogs = ref([
  {
    record_id: 8001, // stu_learning_record.record_id
    student_id: 1001, // stu_learning_record.student_id
    course_id: 601, // stu_learning_record.course_id
    chapter_id: 901, // stu_learning_record.chapter_id
    learning_type: 'MATERIAL', // stu_learning_record.learning_type (ENUM: 'VIDEO','MATERIAL','EXERCISE','REVIEW')
    content_title: '第6章 定积分的应用', // stu_learning_record.content_title
    start_time: '2025-12-15 08:30:00', // stu_learning_record.start_time (DATETIME)
    end_time: '2025-12-15 09:30:00', // stu_learning_record.end_time (DATETIME)
    duration: 3600, // stu_learning_record.duration (秒)
    progress: 100, // stu_learning_record.progress (0-100)
    status: 'COMPLETED', // stu_learning_record.status (ENUM: 'IN_PROGRESS','COMPLETED','PAUSED')
  },
  {
    record_id: 8002,
    student_id: 1001,
    course_id: 601,
    chapter_id: 902,
    learning_type: 'EXERCISE',
    content_title: '导数运算练习',
    start_time: '2025-12-10 10:00:00',
    end_time: '2025-12-10 10:45:00',
    duration: 2700,
    progress: 100,
    status: 'COMPLETED',
  },
  {
    record_id: 8003,
    student_id: 1001,
    course_id: 601,
    chapter_id: 901,
    learning_type: 'VIDEO',
    content_title: '第5章 微分中值定理',
    start_time: '2025-12-08 08:30:00',
    end_time: '2025-12-08 09:15:00',
    duration: 2700,
    progress: 100,
    status: 'COMPLETED',
  },
]);

// 知识点掌握情况
// 对应数据库表：edu_knowledge_point, analysis_student_profile
const knowledgePoints = ref([
  {
    point_id: 1001, // edu_knowledge_point.point_id
    course_id: 601, // edu_knowledge_point.course_id
    point_name: '极限', // edu_knowledge_point.point_name
    difficulty_level: 3, // edu_knowledge_point.difficulty_level (1-5)
    importance_level: 5, // edu_knowledge_point.importance_level (1-5)
    mastery_rate: 37, // analysis_student_profile.mastery_rate (来自学生画像分析表)
  },
  {
    point_id: 1002,
    course_id: 601,
    point_name: '导数',
    difficulty_level: 4,
    importance_level: 4,
    mastery_rate: 49,
  },
  {
    point_id: 1003,
    course_id: 601,
    point_name: '微分应用',
    difficulty_level: 3,
    importance_level: 4,
    mastery_rate: 78,
  },
  {
    point_id: 1004,
    course_id: 601,
    point_name: '积分',
    difficulty_level: 4,
    importance_level: 5,
    mastery_rate: 55,
  },
]);

// 错题筛选类型
const wrongFilter = ref('all');
// 错题记录
// 对应数据库表：stu_wrong_question, prep_question_bank
const wrongQuestions = ref([
  {
    wrong_id: 1, // stu_wrong_question.wrong_id
    student_id: 1001, // stu_wrong_question.student_id
    question_id: 2001, // stu_wrong_question.question_id
    course_id: 601, // stu_wrong_question.course_id
    question_type: 'BLANK', // prep_question_bank.question_type (ENUM: 'SINGLE','MULTIPLE','JUDGE','BLANK','ESSAY')
    question_text: 'Q1. 求极限 lim(x→0) (sin x)/x = ____', // prep_question_bank.question_text
    wrong_answer: '0', // stu_wrong_question.wrong_answer
    correct_answer: '1', // prep_question_bank.answer
    analysis: '这是重要极限公式，需熟记', // prep_question_bank.analysis
    wrong_time: '2025-12-08 10:30:00', // stu_wrong_question.wrong_time (DATETIME)
  },
  {
    wrong_id: 2,
    student_id: 1001,
    question_id: 2002,
    course_id: 601,
    question_type: 'SINGLE',
    question_text: 'Q2. 函数 f(x) = x³ 的导数是？',
    wrong_answer: 'A',
    correct_answer: 'B) 3x²',
    analysis: "幂函数求导法则 (xⁿ)' = n·xⁿ⁻¹",
    wrong_time: '2025-12-07 14:20:00',
  },
  {
    wrong_id: 3,
    student_id: 1001,
    question_id: 2003,
    course_id: 601,
    question_type: 'ESSAY',
    question_text: 'Q3. 求定积分 ∫[0,1] 2x dx = ?',
    wrong_answer: 'x²',
    correct_answer: '1',
    analysis: '记得代入上下限进行计算',
    wrong_time: '2025-12-06 16:45:00',
  },
]);

// 过滤后的错题
const filteredWrongQuestions = computed(() => {
  if (wrongFilter.value === 'all') {
    return wrongQuestions.value;
  }
  // 前端筛选类型映射到数据库ENUM
  const typeMap = {
    choice: 'SINGLE',
    fill: 'BLANK',
    calculation: 'ESSAY',
  };
  return wrongQuestions.value.filter(
    q => q.question_type === typeMap[wrongFilter.value]
  );
});

// 章节列表
// 对应数据库表：edu_course_chapter
const chapters = ref([
  {
    chapter_id: 901, // edu_course_chapter.chapter_id
    course_id: 601, // edu_course_chapter.course_id
    chapter_no: '1', // edu_course_chapter.chapter_no
    chapter_name: '第一章 函数与极限', // edu_course_chapter.chapter_name
    learning_hours: 4, // edu_course_chapter.learning_hours
    learning_objectives: '主要内容：函数的概念、极限的定义与性质、连续性', // edu_course_chapter.learning_objectives
    completion_status: 'COMPLETED', // 前端计算字段 (ENUM: 'NOT_STARTED','IN_PROGRESS','COMPLETED')
    knowledge_point_count: 8, // 前端统计字段，用于显示"8个知识点"
  },
  {
    chapter_id: 902,
    course_id: 601,
    chapter_no: '2',
    chapter_name: '第二章 导数与微分',
    learning_hours: 5,
    learning_objectives: '主要内容：导数的概念、求导法则、微分的应用',
    completion_status: 'IN_PROGRESS',
    knowledge_point_count: 10,
  },
  {
    chapter_id: 903,
    course_id: 601,
    chapter_no: '3',
    chapter_name: '第三章 积分学',
    learning_hours: 6,
    learning_objectives: '主要内容：不定积分、定积分、积分的应用',
    completion_status: 'NOT_STARTED',
    knowledge_point_count: 12,
  },
]);

// 作业列表
// 对应数据库表：eval_assignment, eval_submission
const homeworks = ref([
  {
    assignment_id: 5001, // eval_assignment.assignment_id
    course_id: 601, // eval_assignment.course_id
    title: '第6章 导数运算', // eval_assignment.title
    end_time: '2025-12-20 23:59:00', // eval_assignment.end_time (DATETIME)
    total_score: 10, // eval_assignment.total_score
    submission_status: 'NOT_SUBMITTED', // eval_submission.status (ENUM: 'NOT_SUBMITTED','SUBMITTED','GRADING','GRADED','RETURNED')
  },
  {
    assignment_id: 5002,
    course_id: 601,
    title: '第5章 微分中值定理',
    end_time: '2025-12-15 23:59:00',
    total_score: 8,
    submission_status: 'GRADED',
  },
]);

// 考试列表
// 对应数据库表：edu_exam_arrangement, analysis_score
const exams = ref([
  {
    arrangement_id: 1, // edu_exam_arrangement.arrangement_id
    course_id: 601, // edu_exam_arrangement.course_id
    exam_name: '期中考试', // edu_exam_arrangement.exam_name
    exam_date: '2025-11-20', // edu_exam_arrangement.exam_date (DATE)
    start_time: '14:00:00', // edu_exam_arrangement.start_time (TIME)
    end_time: '16:00:00', // edu_exam_arrangement.end_time (TIME)
    total_score: null, // analysis_score.total_score (如果已考试并评分)
  },
  {
    arrangement_id: 2,
    course_id: 601,
    exam_name: '第一次月考',
    exam_date: '2025-10-15',
    start_time: '14:00:00',
    end_time: '16:00:00',
    total_score: 85,
  },
]);
// ==================== 🔴 模拟数据 END ====================

// 返回上一页
const goBack = () => {
  router.push('/student');
};

// 进入课堂
const enterClassroom = () => {
  ElMessage.info('进入课堂功能开发中');
};

// 切换视图
const switchView = view => {
  activeView.value = view;
};

// 查看知识点详情
const viewKnowledge = content => {
  ElMessage.info(`查看详情：${content}`);
};

// 开始练习
const startPractice = content => {
  ElMessage.info(`开始练习：${content}`);
};

// 随机练习错题
const randomPractice = () => {
  ElMessage.info('开始随机练习错题');
};

// 筛选错题
const filterWrong = type => {
  wrongFilter.value = type;
};

// 进入学习/继续学习
const enterChapter = chapter => {
  if (chapter.completion_status === 'NOT_STARTED') {
    ElMessage.warning('该章节尚未解锁');
    return;
  }
  ElMessage.info(`进入学习：${chapter.chapter_name}`);
};

// 章节测试
const chapterTest = chapter => {
  if (chapter.completion_status !== 'COMPLETED') {
    ElMessage.warning('请先完成该章节的学习');
    return;
  }
  ElMessage.info(`开始测试：${chapter.chapter_name}`);
};

// 查看作业/考试详情
const viewTask = task => {
  ElMessage.info(`查看详情：${task.title || task.exam_name}`);
};

// ==================== 前端辅助函数 START ====================
// 这些函数用于将数据库字段格式化为前端显示格式

// 格式化学习日志的日期和时间（用于前端显示）
const formatLogDate = startTime => {
  const date = new Date(startTime);
  return `${date.getMonth() + 1}-${date
    .getDate()
    .toString()
    .padStart(2, '0')} 周${'日一二三四五六'[date.getDay()]}`;
};

const formatLogTime = startTime => {
  const date = new Date(startTime);
  return `${date.getHours().toString().padStart(2, '0')}:${date
    .getMinutes()
    .toString()
    .padStart(2, '0')}`;
};

const getLogTag = learningType => {
  const tagMap = {
    VIDEO: '视频',
    MATERIAL: '知识点',
    EXERCISE: '练习',
    REVIEW: '复习',
  };
  return tagMap[learningType] || learningType;
};

// 获取知识点状态（根据掌握率）
const getKnowledgeStatus = masteryRate => {
  if (masteryRate < 40)
    return { status: 'weak', color: '#ef4444', badge: '薄弱' };
  if (masteryRate < 60)
    return {
      status: 'normal',
      color: '#f59e0b',
      badge: masteryRate < 50 ? '待提升' : '一般',
    };
  return { status: 'good', color: '#22c55e', badge: '良好' };
};

// 获取章节状态显示
const getChapterStatusColor = completionStatus => {
  const colorMap = {
    COMPLETED: '#22c55e',
    IN_PROGRESS: '#f59e0b',
    NOT_STARTED: '#6b7280',
  };
  return colorMap[completionStatus] || '#6b7280';
};

const getChapterMeta = (knowledgePointCount, learningHours) => {
  return `${knowledgePointCount}个知识点 · 预计学习时间 ${learningHours}小时`;
};

// 格式化作业截止时间（用于前端显示）
const formatHomeworkDeadline = endTime => {
  const date = new Date(endTime);
  return `${date.getMonth() + 1}-${date
    .getDate()
    .toString()
    .padStart(2, '0')} ${date.getHours().toString().padStart(2, '0')}:${date
    .getMinutes()
    .toString()
    .padStart(2, '0')}`;
};

// 获取作业状态图标和文本（用于前端显示）
const getHomeworkIcon = submissionStatus => {
  return submissionStatus === 'GRADED' || submissionStatus === 'RETURNED'
    ? '✅'
    : '📋';
};

const getHomeworkStatusText = submissionStatus => {
  return submissionStatus === 'GRADED' || submissionStatus === 'RETURNED'
    ? '已完成'
    : '进行中';
};

// 格式化考试时间（用于前端显示）
const formatExamTime = (examDate, startTime, endTime) => {
  const date = new Date(examDate);
  const start = startTime.substring(0, 5); // HH:MM
  const end = endTime.substring(0, 5);
  return `${date.getMonth() + 1}月${date.getDate()}日 ${start}-${end}`;
};

// 获取考试状态图标和文本（用于前端显示）
const getExamIcon = totalScore => {
  return totalScore !== null ? '✅' : '📋';
};

const getExamStatusText = totalScore => {
  return totalScore !== null ? '已完成' : '待评分';
};

// ==================== 前端辅助函数 END ====================
</script>

<template>
  <div class="course-detail">
    <!-- 汉堡菜单按钮 - 侧边栏关闭时显示 -->
    <MobileMenuToggle
      :is-open="sidebarOpen"
      :fixed="true"
      @toggle="toggleSidebar"
    />

    <!-- 遮罩层 -->
    <SidebarOverlay :is-show="sidebarOpen" @close="closeSidebar" />

    <!-- 左侧边栏 -->
    <aside :class="['sidebar', { 'mobile-open': sidebarOpen }]">
      <div class="brand">课程详情</div>
      <div class="sidebar-menu">
        <div
          :class="['menu-item', { active: activeView === 'learning' }]"
          @click="
            switchView('learning');
            closeSidebar();
          "
        >
          学习记录
        </div>
        <div
          :class="['menu-item', { active: activeView === 'chapters' }]"
          @click="
            switchView('chapters');
            closeSidebar();
          "
        >
          章节内容
        </div>
        <div
          :class="['menu-item', { active: activeView === 'tasks' }]"
          @click="
            switchView('tasks');
            closeSidebar();
          "
        >
          课程任务
        </div>
      </div>
    </aside>

    <!-- 主内容区 -->
    <main class="main-content">
      <!-- 顶部栏 -->
      <div class="topbar">
        <div class="breadcrumb">
          <a @click="goBack">返回</a>
          <span>/</span>
          <span class="current">{{ courseName }}</span>
          <span>·</span>
          <span>课程详情</span>
        </div>

        <div class="topbar-actions">
          <el-button type="primary" size="small" @click="enterClassroom">
            进入课堂
          </el-button>
          <span style="color: #94a3b8; font-size: 12px"
            >学年学期 · 第 2 周</span
          >
        </div>
      </div>

      <!-- 内容区域 -->
      <div class="content-area">
        <!-- 学习记录视图 -->
        <div v-show="activeView === 'learning'" class="panel">
          <div class="panel-title">📚 学习记录</div>

          <!-- 二级Tab -->
          <div class="sub-tabs">
            <div
              :class="['sub-tab', { active: activeLearningTab === 'log' }]"
              @click="activeLearningTab = 'log'"
            >
              学习日志
            </div>
            <div
              :class="['sub-tab', { active: activeLearningTab === 'profile' }]"
              @click="activeLearningTab = 'profile'"
            >
              学习画像
            </div>
            <div
              :class="['sub-tab', { active: activeLearningTab === 'wrong' }]"
              @click="activeLearningTab = 'wrong'"
            >
              错题记录
            </div>
          </div>

          <!-- 学习日志 -->
          <div v-show="activeLearningTab === 'log'">
            <div
              v-for="log in learningLogs"
              :key="log.record_id"
              class="log-item"
            >
              <div class="log-date">{{ formatLogDate(log.start_time) }}</div>
              <div class="log-card">
                <div class="log-time">{{ formatLogTime(log.start_time) }}</div>
                <div class="log-tag">{{ getLogTag(log.learning_type) }}</div>
                <div>{{ log.content_title }}</div>
              </div>
              <el-button
                v-if="
                  log.learning_type === 'MATERIAL' ||
                  log.learning_type === 'VIDEO'
                "
                type="primary"
                size="small"
                @click="viewKnowledge(log.content_title)"
              >
                📚 查看详情
              </el-button>
              <el-button
                v-else
                type="success"
                size="small"
                @click="startPractice(log.content_title)"
              >
                💪 开始练习
              </el-button>
            </div>
          </div>

          <!-- 学习画像 -->
          <div v-show="activeLearningTab === 'profile'">
            <div class="knowledge-grid">
              <div
                v-for="point in knowledgePoints"
                :key="point.point_id"
                :class="[
                  'knowledge-card',
                  getKnowledgeStatus(point.mastery_rate).status,
                ]"
              >
                <div class="knowledge-header">
                  <div class="knowledge-name">{{ point.point_name }}</div>
                  <span
                    class="knowledge-badge"
                    :style="{
                      background: getKnowledgeStatus(point.mastery_rate).color,
                    }"
                  >
                    {{ getKnowledgeStatus(point.mastery_rate).badge }}
                  </span>
                </div>
                <div class="progress-bar">
                  <div
                    class="progress-fill"
                    :style="{
                      width: point.mastery_rate + '%',
                      background: getKnowledgeStatus(point.mastery_rate).color,
                    }"
                  ></div>
                </div>
                <div style="font-weight: 600; margin-bottom: 6px">
                  {{ point.mastery_rate }}%
                </div>
                <div
                  style="font-size: 12px; color: #6b7280; margin-bottom: 8px"
                >
                  难度等级：{{ point.difficulty_level }} | 重要度：{{
                    point.importance_level
                  }}
                </div>
                <el-button
                  size="small"
                  :type="
                    getKnowledgeStatus(point.mastery_rate).status === 'good'
                      ? 'success'
                      : 'warning'
                  "
                  style="width: 100%"
                >
                  {{
                    getKnowledgeStatus(point.mastery_rate).status === 'good'
                      ? '✨ 保持水平'
                      : '🔥 专项突破'
                  }}
                </el-button>
              </div>
            </div>
          </div>

          <!-- 错题记录 -->
          <div v-show="activeLearningTab === 'wrong'">
            <div class="wrong-header">
              <div style="color: #6b7280">
                共找到
                <span style="font-weight: 600">{{
                  filteredWrongQuestions.length
                }}</span>
                道错题
              </div>
              <el-button type="primary" size="small" @click="randomPractice">
                随机练习
              </el-button>
            </div>

            <div class="filter-buttons">
              <div
                :class="['filter-btn', { active: wrongFilter === 'all' }]"
                @click="filterWrong('all')"
              >
                全部
              </div>
              <div
                :class="['filter-btn', { active: wrongFilter === 'choice' }]"
                @click="filterWrong('choice')"
              >
                选择题
              </div>
              <div
                :class="['filter-btn', { active: wrongFilter === 'fill' }]"
                @click="filterWrong('fill')"
              >
                填空题
              </div>
              <div
                :class="[
                  'filter-btn',
                  { active: wrongFilter === 'calculation' },
                ]"
                @click="filterWrong('calculation')"
              >
                计算题
              </div>
            </div>

            <div
              v-for="q in filteredWrongQuestions"
              :key="q.wrong_id"
              class="wrong-card"
            >
              <div class="wrong-question">{{ q.question_text }}</div>
              <div class="wrong-answer">
                你的答案：{{ q.wrong_answer }}；正确答案：{{ q.correct_answer }}
              </div>
              <div class="wrong-tip">💡 提示：{{ q.analysis }}</div>
            </div>
          </div>
        </div>

        <!-- 章节内容视图 -->
        <div v-show="activeView === 'chapters'" class="panel">
          <div class="panel-title">📖 章节内容</div>

          <div
            v-for="chapter in chapters"
            :key="chapter.chapter_id"
            class="chapter-card"
          >
            <div class="chapter-header">
              <div
                class="chapter-number"
                :style="{
                  background: getChapterStatusColor(chapter.completion_status),
                }"
              >
                {{ chapter.chapter_no }}
              </div>
              <div class="chapter-info">
                <div class="chapter-title">{{ chapter.chapter_name }}</div>
                <div class="chapter-meta">
                  {{
                    getChapterMeta(
                      chapter.knowledge_point_count,
                      chapter.learning_hours
                    )
                  }}
                </div>
              </div>
              <el-tag
                v-if="chapter.completion_status === 'COMPLETED'"
                type="success"
                size="small"
              >
                已完成
              </el-tag>
              <el-tag
                v-else-if="chapter.completion_status === 'IN_PROGRESS'"
                type="warning"
                size="small"
              >
                学习中
              </el-tag>
              <el-tag v-else type="info" size="small">未开始</el-tag>
            </div>
            <div class="chapter-content">{{ chapter.learning_objectives }}</div>
            <div style="display: flex; gap: 8px">
              <el-button
                type="primary"
                size="small"
                :disabled="chapter.completion_status === 'NOT_STARTED'"
                @click="enterChapter(chapter)"
              >
                {{
                  chapter.completion_status === 'IN_PROGRESS'
                    ? '继续学习'
                    : '进入学习'
                }}
              </el-button>
              <el-button
                size="small"
                :disabled="chapter.completion_status !== 'COMPLETED'"
                @click="chapterTest(chapter)"
              >
                章节测试
              </el-button>
            </div>
          </div>
        </div>

        <!-- 课程任务视图 -->
        <div v-show="activeView === 'tasks'" class="panel">
          <div class="panel-title">📋 课程任务</div>

          <!-- 二级Tab -->
          <div class="sub-tabs">
            <div
              :class="['sub-tab', { active: activeTaskTab === 'homework' }]"
              @click="activeTaskTab = 'homework'"
            >
              作业
            </div>
            <div
              :class="['sub-tab', { active: activeTaskTab === 'exam' }]"
              @click="activeTaskTab = 'exam'"
            >
              考试
            </div>
          </div>

          <!-- 作业 -->
          <div v-show="activeTaskTab === 'homework'">
            <div
              v-for="hw in homeworks"
              :key="hw.assignment_id"
              class="task-card"
              @click="viewTask(hw)"
            >
              <div class="task-row">
                <div class="task-icon">
                  {{ getHomeworkIcon(hw.submission_status) }}
                </div>
                <div class="task-info">
                  <div class="task-title">{{ hw.title }}</div>
                  <div class="task-time">
                    截止：{{ formatHomeworkDeadline(hw.end_time) }} |
                    {{ hw.total_score }}分
                  </div>
                </div>
                <div
                  :class="[
                    'task-status',
                    hw.submission_status === 'NOT_SUBMITTED' ||
                    hw.submission_status === 'SUBMITTED'
                      ? 'status-pending'
                      : 'status-completed',
                  ]"
                >
                  {{ getHomeworkStatusText(hw.submission_status) }}
                </div>
              </div>
            </div>
          </div>

          <!-- 考试 -->
          <div v-show="activeTaskTab === 'exam'">
            <div
              v-for="exam in exams"
              :key="exam.arrangement_id"
              class="task-card"
              @click="viewTask(exam)"
            >
              <div class="task-row">
                <div class="task-icon">{{ getExamIcon(exam.total_score) }}</div>
                <div class="task-info">
                  <div class="task-title">{{ exam.exam_name }}</div>
                  <div class="task-time">
                    考试时间：{{
                      formatExamTime(
                        exam.exam_date,
                        exam.start_time,
                        exam.end_time
                      )
                    }}
                  </div>
                </div>
                <div style="display: flex; align-items: center; gap: 8px">
                  <div
                    :class="[
                      'task-status',
                      exam.total_score !== null
                        ? 'status-completed'
                        : 'status-pending',
                    ]"
                  >
                    {{ getExamStatusText(exam.total_score) }}
                  </div>
                  <div
                    v-if="exam.total_score !== null"
                    style="font-weight: 600"
                  >
                    {{ exam.total_score }}分
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>
