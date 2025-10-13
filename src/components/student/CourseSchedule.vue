<style scoped>
/* 课程/课表视图容器 */
.course-schedule {
  display: flex;
  flex-direction: column;
  height: 100%;
  min-height: 0;
}

/* 课程/课表视图 */
.schedule-header {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  align-items: center;
  gap: 12px;
  padding: 16px 20px;
  border-bottom: 1px solid #e5e7eb;
  flex-shrink: 0;
}

.controls {
  display: flex;
  align-items: center;
  gap: 10px;
}

.controls-right {
  justify-content: flex-end;
}

.view-tabs {
  display: inline-flex;
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  overflow: hidden;
}

.view-tabs .el-button {
  border: 0;
  border-radius: 0;
}

.view-tabs .el-button + .el-button {
  margin-left: 0;
}

/* 课表网格 */
.schedule-wrap {
  padding: 18px 22px;
}

.schedule-legend {
  display: flex;
  justify-content: flex-end;
  gap: 16px;
  margin-bottom: 10px;
  font-size: 12px;
  color: #6b7280;
  flex-shrink: 0;
}

.legend-item {
  display: flex;
  align-items: center;
  gap: 4px;
}

.schedule-grid {
  display: grid;
  grid-template-columns: 85px repeat(7, 1fr);
  grid-template-rows: auto repeat(5, minmax(120px, 1fr));
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  overflow: hidden;
  background: white;
  max-height: calc(100vh - 280px);
}

.grid-header {
  display: contents;
}

.grid-header div {
  padding: 16px 10px;
  font-weight: 600;
  text-align: center;
  color: #475569;
  font-size: 13px;
  background: linear-gradient(135deg, #f8fafc, #e2e8f0);
  border-bottom: 2px solid #e2e8f0;
  border-right: 1px solid #e5e7eb;
}

.time-col {
  grid-column: 1;
  grid-row: 2 / -1;
  display: flex;
  flex-direction: column;
  background: linear-gradient(135deg, #f1f5f9, #e2e8f0);
  border-right: 1px solid #e5e7eb;
}

.time-slot {
  padding: 14px 10px;
  font-size: 12px;
  color: #6b7280;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  line-height: 1.4;
  flex: 1;
  border-bottom: 1px solid #e5e7eb;
  font-weight: 600;
}

.time-slot:last-child {
  border-bottom: none;
}

.schedule-cell {
  border-right: 1px solid #e5e7eb;
  border-bottom: 1px solid #e5e7eb;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 12px 8px;
  cursor: pointer;
  transition: all 0.2s ease;
}

.schedule-cell:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  z-index: 1;
}

.schedule-cell.empty {
  background: #fafafa;
  cursor: default;
}

.schedule-cell.empty:hover {
  transform: none;
  box-shadow: none;
}

/* 课程状态 */
.course-done {
  background: linear-gradient(135deg, #ecfdf5, #dcfce7);
  border: 1px solid #a7f3d0;
}

.course-upcoming {
  background: linear-gradient(135deg, #fef7f7, #fee2e2);
  border: 1px solid #fca5a5;
}

.course-not-started {
  background: linear-gradient(135deg, #f9fafb, #f3f4f6);
  border: 1px solid #d1d5db;
}

.course-content {
  width: 100%;
  text-align: center;
}

.course-name {
  font-size: 14px;
  font-weight: 600;
  line-height: 1.3;
  margin-bottom: 4px;
  color: #374151;
}

.teacher-name {
  font-size: 12px;
  color: #6b7280;
  line-height: 1.2;
}

.status-icon {
  position: absolute;
  top: 6px;
  right: 6px;
  font-size: 10px;
}

/* 课程列表 */
.course-list {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 20px;
  padding: 20px;
}

.course-card {
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 18px;
  background: #fff;
  transition: all 0.2s;
  cursor: pointer;
}

.course-card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transform: translateY(-2px);
}

.course-placeholder {
  height: 120px;
  border: 1px dashed #e5e7eb;
  border-radius: 10px;
  background: #fafafa;
  margin-bottom: 12px;
}

.course-card h4 {
  margin: 0 0 8px 0;
  font-size: 16px;
  color: #1f2544;
}

.course-meta {
  color: #6b7280;
  font-size: 13px;
  margin-bottom: 4px;
}

/* 周数选择器 */
.week-picker {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
}

.week-row {
  display: flex;
  align-items: center;
  gap: 12px;
}

.week-list {
  display: flex;
  align-items: center;
  gap: 12px;
}

.week-num {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  display: grid;
  place-items: center;
  color: #334155;
  cursor: pointer;
  font-size: 14px;
  transition: all 0.2s;
}

.week-num:hover {
  background: #f1f5f9;
}

.week-num.active {
  background: var(--primary-color);
  color: #fff;
  box-shadow: 0 4px 12px rgba(91, 124, 255, 0.35);
}

.week-info {
  color: #6b7280;
  font-size: 12px;
  text-align: center;
}

.week-current {
  color: var(--primary-color);
  font-weight: 600;
}

/* 全部周数弹出层样式 */
.all-weeks-btn {
  margin-left: 8px;
  background: linear-gradient(135deg, #f8fafc, #e2e8f0) !important;
  border-color: #cbd5e1 !important;
  color: #475569 !important;
  font-weight: 500;
}

.all-weeks-btn:hover {
  background: linear-gradient(135deg, #e2e8f0, #cbd5e1) !important;
  border-color: #94a3b8 !important;
  color: #334155 !important;
  transform: translateY(-1px);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.all-weeks-grid {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 8px;
  padding: 12px;
  max-width: 280px;
}

.week-item {
  width: 44px;
  height: 44px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 500;
  color: #64748b;
  background: linear-gradient(135deg, #ffffff, #f8fafc);
  cursor: pointer;
  transition: all 0.25s ease;
}

.week-item:hover {
  border-color: #94a3b8;
  color: #334155;
  background: linear-gradient(135deg, #f1f5f9, #e2e8f0);
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(100, 116, 139, 0.15);
}

.week-item.active {
  background: linear-gradient(135deg, var(--primary-color), #4f81f5);
  color: white;
  border-color: var(--primary-color);
  box-shadow: 0 4px 16px rgba(91, 124, 255, 0.35);
  font-weight: 600;
}

.week-item-label {
  font-size: 10px;
  color: #cbd5e1;
  margin-top: 2px;
  font-weight: 400;
}

.week-item:hover .week-item-label {
  color: #94a3b8;
}

.week-item.active .week-item-label {
  color: rgba(255, 255, 255, 0.85);
}

/* 响应式 */
@media (max-width: 1200px) {
  .course-list {
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
  }
}

@media (max-width: 860px) {
  .schedule-header {
    grid-template-columns: 1fr;
    gap: 12px;
  }

  .controls {
    justify-content: center;
  }

  .schedule-grid {
    font-size: 11px;
  }

  .course-name {
    font-size: 11px;
  }

  .teacher-name {
    font-size: 9px;
  }
}
</style>

<script setup>
import { ref, computed } from 'vue';
import { ElMessage } from 'element-plus';

// 当前视图：schedule(课表) 或 courses(课程列表)
const currentViewType = ref('schedule');

// 学期列表
const semesters = ref([
  '2025-2026 上学期',
  '2025-2026 下学期',
  '2024-2025 上学期',
]);
const selectedSemester = ref('2025-2026 上学期');

// 当前周数
const currentWeek = ref(2);
const totalWeeks = 20;

// 周数列表（窗口显示5个）
const visibleWeeks = ref([]);

// 全部周数列表（用于弹出层显示）
const allWeeks = computed(() => {
  const weeks = [];
  for (let i = 1; i <= totalWeeks; i++) {
    weeks.push(i);
  }
  return weeks;
});

// 更新可见周数
const updateVisibleWeeks = () => {
  const start = Math.max(1, Math.min(currentWeek.value - 2, totalWeeks - 4));
  visibleWeeks.value = [];
  for (let i = start; i <= Math.min(totalWeeks, start + 4); i++) {
    visibleWeeks.value.push(i);
  }
};

// 切换周数
const prevWeek = () => {
  if (currentWeek.value > 1) {
    currentWeek.value--;
    updateVisibleWeeks();
  }
};

const nextWeek = () => {
  if (currentWeek.value < totalWeeks) {
    currentWeek.value++;
    updateVisibleWeeks();
  }
};

const selectWeek = week => {
  currentWeek.value = week;
  updateVisibleWeeks();
};

// 从全部周数中选择某周
const handleWeekSelect = week => {
  currentWeek.value = week;
  updateVisibleWeeks();
  ElMessage.success(`已切换到第${week}周`);
};

// 初始化周数
updateVisibleWeeks();

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API获取课表数据
// API接口: GET /api/student/schedule?semesterId=xxx&week=xxx
// 对应数据库表：edu_course_offering, edu_course, sys_user, edu_teacher, edu_classroom

// 课程数据
const courses = ref([
  {
    offering_id: 1001, // edu_course_offering.offering_id
    course_id: 501, // edu_course.course_id
    course_name: '计算机网络', // edu_course.course_name
    teacher_id: 201, // edu_teacher.teacher_id
    teacher_name: '孔老师', // sys_user.real_name（冗余字段，便于显示）
    week_day: 1, // edu_course_offering.week_day（1-7，周一到周日）
    start_period: 1, // edu_course_offering.start_period（节次）
    end_period: 2, // edu_course_offering.end_period
    classroom_id: 301, // edu_classroom.classroom_id
    classroom_name: 'A301', // edu_classroom.classroom_name（冗余字段）
  },
  {
    offering_id: 1002,
    course_id: 502,
    course_name: '软件工程',
    teacher_id: 202,
    teacher_name: '刘老师',
    week_day: 1,
    start_period: 4,
    end_period: 5,
    classroom_id: 302,
    classroom_name: 'B205',
  },
  {
    offering_id: 1003,
    course_id: 502,
    course_name: '软件工程',
    teacher_id: 202,
    teacher_name: '刘老师',
    week_day: 2,
    start_period: 1,
    end_period: 2,
    classroom_id: 303,
    classroom_name: 'A201',
  },
  {
    offering_id: 1004,
    course_id: 503,
    course_name: 'MVVM框架',
    teacher_id: 203,
    teacher_name: '熊老师',
    week_day: 2,
    start_period: 5,
    end_period: 5,
    classroom_id: 304,
    classroom_name: 'C102',
  },
  {
    offering_id: 1005,
    course_id: 504,
    course_name: 'Java Web高级',
    teacher_id: 204,
    teacher_name: '各老师',
    week_day: 3,
    start_period: 1,
    end_period: 2,
    classroom_id: 305,
    classroom_name: 'A301',
  },
  {
    offering_id: 1006,
    course_id: 505,
    course_name: '数学建模',
    teacher_id: 205,
    teacher_name: '丁老师',
    week_day: 3,
    start_period: 3,
    end_period: 4,
    classroom_id: 306,
    classroom_name: 'B301',
  },
  {
    offering_id: 1007,
    course_id: 506,
    course_name: '软件设计',
    teacher_id: 202,
    teacher_name: '刘老师',
    week_day: 3,
    start_period: 5,
    end_period: 5,
    classroom_id: 307,
    classroom_name: 'C201',
  },
  {
    offering_id: 1008,
    course_id: 507,
    course_name: 'Java反射',
    teacher_id: 206,
    teacher_name: '罗老师',
    week_day: 4,
    start_period: 1,
    end_period: 2,
    classroom_id: 308,
    classroom_name: 'A302',
  },
  {
    offering_id: 1009,
    course_id: 508,
    course_name: 'Docker容器',
    teacher_id: 206,
    teacher_name: '罗老师',
    week_day: 4,
    start_period: 5,
    end_period: 5,
    classroom_id: 309,
    classroom_name: 'B401',
  },
  {
    offering_id: 1010,
    course_id: 501,
    course_name: '计算机网络',
    teacher_id: 201,
    teacher_name: '孔老师',
    week_day: 5,
    start_period: 1,
    end_period: 2,
    classroom_id: 301,
    classroom_name: 'A301',
  },
  {
    offering_id: 1011,
    course_id: 506,
    course_name: '软件设计',
    teacher_id: 202,
    teacher_name: '刘老师',
    week_day: 6,
    start_period: 3,
    end_period: 4,
    classroom_id: 307,
    classroom_name: 'C201',
  },
  {
    offering_id: 1012,
    course_id: 503,
    course_name: 'MVVM框架',
    teacher_id: 203,
    teacher_name: '熊老师',
    week_day: 7,
    start_period: 3,
    end_period: 4,
    classroom_id: 304,
    classroom_name: 'C102',
  },
  {
    offering_id: 1013,
    course_id: 508,
    course_name: 'Docker容器',
    teacher_id: 206,
    teacher_name: '罗老师',
    week_day: 7,
    start_period: 5,
    end_period: 5,
    classroom_id: 309,
    classroom_name: 'B401',
  },
]);
// ==================== 🔴 模拟数据 END ====================

// ==================== 🔴 模拟数据 START ====================
// TODO: 后续需要从后端API获取选课列表
// API接口: GET /api/student/courses
// 对应数据库表：edu_student_course, edu_course, edu_class, sys_user

// 课程列表数据
const courseList = ref([
  {
    enrollment_id: 2001, // edu_student_course.enrollment_id
    course_id: 601, // edu_course.course_id
    course_code: 'MATH101', // edu_course.course_code
    course_name: '高等数学（上）', // edu_course.course_name
    class_id: 101, // edu_class.class_id
    class_name: '数学一班', // edu_class.class_name
    grade: 2025, // edu_class.grade
    teacher_id: 211, // edu_teacher.teacher_id
    teacher_name: '王老师', // sys_user.real_name
    credit: 4.0, // edu_course.credit（学分）
    course_type: 'COMPULSORY', // edu_course.course_type（必修）
  },
  {
    enrollment_id: 2002,
    course_id: 602,
    course_code: 'PHYS101',
    course_name: '大学物理',
    class_id: 102,
    class_name: '物理二班',
    grade: 2025,
    teacher_id: 212,
    teacher_name: '李老师',
    credit: 3.5,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2003,
    course_id: 603,
    course_code: 'CS101',
    course_name: '计算机导论',
    class_id: 103,
    class_name: '计科一班',
    grade: 2025,
    teacher_id: 213,
    teacher_name: '赵老师',
    credit: 3.0,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2004,
    course_id: 604,
    course_code: 'MATH102',
    course_name: '线性代数',
    class_id: 101,
    class_name: '数学一班',
    grade: 2025,
    teacher_id: 214,
    teacher_name: '孙老师',
    credit: 3.0,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2005,
    course_id: 605,
    course_code: 'ENG101',
    course_name: '英语（综合）',
    class_id: 104,
    class_name: '外语一班',
    grade: 2025,
    teacher_id: 215,
    teacher_name: '陈老师',
    credit: 4.0,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2006,
    course_id: 606,
    course_code: 'POL101',
    course_name: '思想道德与法治',
    class_id: 105,
    class_name: '公共课',
    grade: 2025,
    teacher_id: 216,
    teacher_name: '周老师',
    credit: 3.0,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2007,
    course_id: 607,
    course_code: 'CS102',
    course_name: '程序设计基础',
    class_id: 103,
    class_name: '计科一班',
    grade: 2025,
    teacher_id: 217,
    teacher_name: '刘老师',
    credit: 4.0,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2008,
    course_id: 608,
    course_code: 'ENG102',
    course_name: '大学英语',
    class_id: 104,
    class_name: '外语一班',
    grade: 2025,
    teacher_id: 218,
    teacher_name: '张老师',
    credit: 4.0,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2009,
    course_id: 609,
    course_code: 'CS201',
    course_name: '数据结构',
    class_id: 103,
    class_name: '计科一班',
    grade: 2025,
    teacher_id: 219,
    teacher_name: '钱老师',
    credit: 4.0,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2010,
    course_id: 610,
    course_code: 'CS202',
    course_name: '操作系统',
    class_id: 103,
    class_name: '计科一班',
    grade: 2025,
    teacher_id: 220,
    teacher_name: '吴老师',
    credit: 3.5,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2011,
    course_id: 611,
    course_code: 'MATH201',
    course_name: '概率论与数理统计',
    class_id: 101,
    class_name: '数学一班',
    grade: 2025,
    teacher_id: 221,
    teacher_name: '郑老师',
    credit: 3.0,
    course_type: 'COMPULSORY',
  },
  {
    enrollment_id: 2012,
    course_id: 612,
    course_code: 'CS203',
    course_name: '数据库原理',
    class_id: 103,
    class_name: '计科一班',
    grade: 2025,
    teacher_id: 222,
    teacher_name: '陈老师',
    credit: 3.5,
    course_type: 'COMPULSORY',
  },
]);
// ==================== 🔴 模拟数据 END ====================

// 获取课程（根据星期和节次）
const getCourse = (day, period) => {
  return courses.value.find(
    c => c.week_day === day && c.start_period === period
  );
};

// 计算课程状态（用于前端显示，不存储在数据库）
const getCourseStatus = course => {
  // TODO: 根据 class_session 表的数据判断课程状态
  // 这里暂时返回模拟状态用于显示
  const now = new Date();
  const currentDay = now.getDay() || 7; // 周日为7
  const currentHour = now.getHours();

  if (course.week_day < currentDay) return 'done';
  if (course.week_day > currentDay) return 'not-started';

  // 当天的课程根据时间判断
  const periodStartHours = [8, 10, 14, 16, 19];
  const startHour = periodStartHours[course.start_period - 1] || 8;

  if (currentHour < startHour) return 'upcoming';
  if (currentHour >= startHour + 2) return 'done';
  return 'upcoming';
};

// 获取课程图标（用于前端显示）
const getCourseIcon = status => {
  const icons = {
    done: '✓',
    upcoming: '🔴',
    'not-started': '⏸',
  };
  return icons[status] || '⏸';
};

// 点击课程（课表视图）
const handleCourseClick = course => {
  ElMessage.info(`课程详情功能开发中：${course.course_name}`);
};

// 点击课程卡片（课程列表视图）
const handleCourseCardClick = course => {
  ElMessage.info(`课程详情功能开发中：${course.course_name}`);
};
</script>

<template>
  <div class="course-schedule">
    <!-- 头部控制栏 -->
    <div class="schedule-header">
      <!-- 左侧：学期选择 -->
      <div class="controls">
        <el-select v-model="selectedSemester" style="width: 200px">
          <el-option
            v-for="semester in semesters"
            :key="semester"
            :label="semester"
            :value="semester"
          />
        </el-select>
      </div>

      <!-- 中间：周数选择器 -->
      <div class="controls">
        <div class="week-picker">
          <div class="week-row">
            <el-button
              circle
              :icon="'ArrowLeft'"
              size="small"
              :disabled="currentWeek <= 1"
              @click="prevWeek"
            />
            <div class="week-list">
              <div
                v-for="week in visibleWeeks"
                :key="week"
                :class="['week-num', { active: week === currentWeek }]"
                @click="selectWeek(week)"
              >
                {{ week }}
              </div>
            </div>
            <el-button
              circle
              :icon="'ArrowRight'"
              size="small"
              :disabled="currentWeek >= totalWeeks"
              @click="nextWeek"
            />
            <!-- 全部周数按钮 -->
            <el-popover placement="bottom" :width="300" trigger="click">
              <template #reference>
                <el-button class="all-weeks-btn" size="small">
                  全部周数
                </el-button>
              </template>
              <div class="all-weeks-grid">
                <div
                  v-for="week in allWeeks"
                  :key="week"
                  :class="['week-item', { active: week === currentWeek }]"
                  @click="handleWeekSelect(week)"
                >
                  <span>{{ week }}</span>
                  <span class="week-item-label">周</span>
                </div>
              </div>
            </el-popover>
          </div>
          <div class="week-info">
            当前选择：<span class="week-current">第{{ currentWeek }}周</span>
          </div>
        </div>
      </div>

      <!-- 右侧：视图切换 -->
      <div class="controls controls-right">
        <el-button-group class="view-tabs">
          <el-button
            :type="currentViewType === 'schedule' ? 'primary' : 'default'"
            @click="currentViewType = 'schedule'"
          >
            课表
          </el-button>
          <el-button
            :type="currentViewType === 'courses' ? 'primary' : 'default'"
            @click="currentViewType = 'courses'"
          >
            课程
          </el-button>
        </el-button-group>
      </div>
    </div>

    <!-- 课表视图 -->
    <div v-if="currentViewType === 'schedule'" class="schedule-wrap">
      <div class="schedule-legend">
        <div class="legend-item">
          <span style="color: #6b7280">⏸</span>
          <span>未开播</span>
        </div>
        <div class="legend-item">
          <span style="color: #16a34a">✓</span>
          <span>已完成</span>
        </div>
        <div class="legend-item">
          <span style="color: #dc2626">🔴</span>
          <span>即将开始</span>
        </div>
      </div>

      <div class="schedule-grid">
        <!-- 表头 -->
        <div class="grid-header">
          <div style="background: linear-gradient(135deg, #f1f5f9, #e2e8f0)">
            时间
          </div>
          <div>周一<br /><span style="font-size: 11px">02-02</span></div>
          <div>周二<br /><span style="font-size: 11px">02-03</span></div>
          <div>周三<br /><span style="font-size: 11px">02-04</span></div>
          <div>周四<br /><span style="font-size: 11px">02-05</span></div>
          <div>周五<br /><span style="font-size: 11px">02-06</span></div>
          <div>周六<br /><span style="font-size: 11px">02-07</span></div>
          <div>周日<br /><span style="font-size: 11px">02-08</span></div>
        </div>

        <!-- 时间列 -->
        <div class="time-col">
          <div class="time-slot">1<br />08:00-10:00</div>
          <div class="time-slot">2<br />10:00-12:00</div>
          <div class="time-slot">3<br />14:30-16:30</div>
          <div class="time-slot">4<br />16:30-18:30</div>
          <div class="time-slot">5<br />19:30-21:30</div>
        </div>

        <!-- 课程格子 -->
        <template v-for="day in 7" :key="`day-${day}`">
          <template v-for="period in 5" :key="`period-${period}`">
            <div
              v-if="getCourse(day, period)"
              :class="[
                'schedule-cell',
                `course-${getCourseStatus(getCourse(day, period))}`,
              ]"
              :style="{
                gridColumn: day + 1,
                gridRow: period + 1,
              }"
              @click="handleCourseClick(getCourse(day, period))"
            >
              <div class="course-content">
                <div class="course-name">
                  {{ getCourse(day, period).course_name }}
                </div>
                <div class="teacher-name">
                  {{ getCourse(day, period).teacher_name }}
                </div>
                <span class="status-icon">{{
                  getCourseIcon(getCourseStatus(getCourse(day, period)))
                }}</span>
              </div>
            </div>
            <div
              v-else
              :class="['schedule-cell', 'empty']"
              :style="{
                gridColumn: day + 1,
                gridRow: period + 1,
              }"
            ></div>
          </template>
        </template>
      </div>
    </div>

    <!-- 课程列表视图 -->
    <div v-else class="course-list">
      <div
        v-for="course in courseList"
        :key="course.enrollment_id"
        class="course-card"
        @click="handleCourseCardClick(course)"
      >
        <div class="course-placeholder"></div>
        <h4>{{ course.course_name }}</h4>
        <div class="course-meta">
          年级/班级：{{ course.grade }}级 {{ course.class_name }}
        </div>
        <div class="course-meta">任课老师：{{ course.teacher_name }}</div>
        <div class="course-meta">学分：{{ course.credit }}</div>
      </div>
    </div>
  </div>
</template>
