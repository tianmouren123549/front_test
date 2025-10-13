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

// 课程数据（模拟数据）
const courses = ref([
  {
    day: 1,
    period: 1,
    name: '计算机网络',
    teacher: '孔老师',
    status: 'not-started',
    icon: '⏸',
  },
  {
    day: 1,
    period: 4,
    name: '软件工程',
    teacher: '刘老师',
    status: 'not-started',
    icon: '⏸',
  },
  {
    day: 2,
    period: 1,
    name: '软件工程',
    teacher: '刘老师',
    status: 'upcoming',
    icon: '🔴',
  },
  {
    day: 2,
    period: 5,
    name: 'MVVM框架',
    teacher: '熊老师',
    status: 'upcoming',
    icon: '🔴',
  },
  {
    day: 3,
    period: 1,
    name: 'Java Web高级',
    teacher: '各老师',
    status: 'done',
    icon: '✓',
  },
  {
    day: 3,
    period: 3,
    name: '数学建模',
    teacher: '丁老师',
    status: 'not-started',
    icon: '⏸',
  },
  {
    day: 3,
    period: 5,
    name: '软件设计',
    teacher: '刘老师',
    status: 'not-started',
    icon: '⏸',
  },
  {
    day: 4,
    period: 1,
    name: 'Java反射',
    teacher: '罗老师',
    status: 'done',
    icon: '✓',
  },
  {
    day: 4,
    period: 5,
    name: 'Docker容器',
    teacher: '罗老师',
    status: 'upcoming',
    icon: '🔴',
  },
  {
    day: 5,
    period: 1,
    name: '计算机网络',
    teacher: '孔老师',
    status: 'not-started',
    icon: '⏸',
  },
  {
    day: 6,
    period: 3,
    name: '软件设计',
    teacher: '刘老师',
    status: 'not-started',
    icon: '⏸',
  },
  {
    day: 7,
    period: 3,
    name: 'MVVM框架',
    teacher: '熊老师',
    status: 'not-started',
    icon: '⏸',
  },
  {
    day: 7,
    period: 5,
    name: 'Docker容器',
    teacher: '罗老师',
    status: 'upcoming',
    icon: '🔴',
  },
]);

// 课程列表数据
const courseList = ref([
  {
    name: '高等数学（上）',
    grade: '2025级',
    class: '数学一班',
    teacher: '王老师',
  },
  { name: '大学物理', grade: '2025级', class: '物理二班', teacher: '李老师' },
  { name: '计算机导论', grade: '2025级', class: '计科一班', teacher: '赵老师' },
  { name: '线性代数', grade: '2025级', class: '数学一班', teacher: '孙老师' },
  {
    name: '英语（综合）',
    grade: '2025级',
    class: '外语一班',
    teacher: '陈老师',
  },
  {
    name: '思想道德与法治',
    grade: '2025级',
    class: '公共课',
    teacher: '周老师',
  },
  {
    name: '程序设计基础',
    grade: '2025级',
    class: '计科一班',
    teacher: '刘老师',
  },
  { name: '大学英语', grade: '2025级', class: '外语一班', teacher: '张老师' },
  { name: '数据结构', grade: '2025级', class: '计科一班', teacher: '钱老师' },
  { name: '操作系统', grade: '2025级', class: '计科一班', teacher: '吴老师' },
  {
    name: '概率论与数理统计',
    grade: '2025级',
    class: '数学一班',
    teacher: '郑老师',
  },
  { name: '数据库原理', grade: '2025级', class: '计科一班', teacher: '陈老师' },
]);

// 获取课程（根据星期和节次）
const getCourse = (day, period) => {
  return courses.value.find(c => c.day === day && c.period === period);
};

// 点击课程
const handleCourseClick = course => {
  ElMessage.info(`课程详情功能开发中：${course.name}`);
};

// 点击课程卡片
const handleCourseCardClick = course => {
  ElMessage.info(`课程详情功能开发中：${course.name}`);
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
                `course-${getCourse(day, period).status}`,
              ]"
              :style="{
                gridColumn: day + 1,
                gridRow: period + 1,
              }"
              @click="handleCourseClick(getCourse(day, period))"
            >
              <div class="course-content">
                <div class="course-name">{{ getCourse(day, period).name }}</div>
                <div class="teacher-name">
                  {{ getCourse(day, period).teacher }}
                </div>
                <span class="status-icon">{{
                  getCourse(day, period).icon
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
        v-for="(course, index) in courseList"
        :key="index"
        class="course-card"
        @click="handleCourseCardClick(course)"
      >
        <div class="course-placeholder"></div>
        <h4>{{ course.name }}</h4>
        <div class="course-meta">
          年级/班级：{{ course.grade }} {{ course.class }}
        </div>
        <div class="course-meta">任课老师：{{ course.teacher }}</div>
      </div>
    </div>
  </div>
</template>
