-- =============================================
-- 智慧教育系统数据库建表语句
-- =============================================

-- 1. 学生信息管理模块
-- =============================================

-- 学生信息表
CREATE TABLE `edu_student` (
    `student_id` INT NOT NULL AUTO_INCREMENT COMMENT '学生ID',
    `user_id` INT NOT NULL COMMENT '用户ID（关联sys_user）',
    `student_no` VARCHAR(30) NOT NULL COMMENT '学号',
    `id_card` VARCHAR(18) COMMENT '身份证号',
    `enrollment_date` DATE COMMENT '入学日期',
    `graduation_date` DATE COMMENT '预计毕业日期',
    `political_status` VARCHAR(20) COMMENT '政治面貌',
    `native_place` VARCHAR(100) COMMENT '籍贯',
    `address` VARCHAR(200) COMMENT '家庭地址',
    `emergency_contact` VARCHAR(30) COMMENT '紧急联系人',
    `emergency_phone` VARCHAR(11) COMMENT '紧急联系电话',
    `status` ENUM('ON_CAMPUS','SUSPENDED','WITHDRAWN','GRADUATED') NOT NULL DEFAULT 'ON_CAMPUS' COMMENT '学籍状态',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`student_id`),
    UNIQUE KEY `uk_user_id` (`user_id`),
    UNIQUE KEY `uk_student_no` (`student_no`),
    UNIQUE KEY `uk_id_card` (`id_card`),
    KEY `idx_status` (`status`),
    KEY `idx_enrollment_date` (`enrollment_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生信息表';

-- 学生班级关联表
CREATE TABLE `edu_student_class` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `class_id` INT NOT NULL COMMENT '班级ID',
    `join_date` DATE COMMENT '加入日期',
    `leave_date` DATE COMMENT '离开日期',
    `status` ENUM('NORMAL','TRANSFERRED') DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_student_class` (`student_id`, `class_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生班级关联表';

-- 学生选课表
CREATE TABLE `edu_student_course` (
    `enrollment_id` INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `offering_id` INT NOT NULL COMMENT '课程开设ID',
    `course_id` INT NOT NULL COMMENT '课程ID（冗余，便于查询）',
    `enroll_type` ENUM('REQUIRED','ELECTIVE') NOT NULL COMMENT '选课类型',
    `enroll_time` DATETIME COMMENT '选课时间',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`enrollment_id`),
    UNIQUE KEY `uk_student_offering` (`student_id`, `offering_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_offering_id` (`offering_id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_enroll_type` (`enroll_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生选课表';

-- =============================================
-- 2. 学习管理模块
-- =============================================

-- 学生学习记录表
CREATE TABLE `stu_learning_record` (
    `record_id` INT NOT NULL AUTO_INCREMENT COMMENT '记录ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `chapter_id` INT COMMENT '章节ID',
    `learning_type` ENUM('VIDEO','MATERIAL','EXERCISE','REVIEW') COMMENT '学习类型',
    `content_title` VARCHAR(200) COMMENT '内容标题',
    `start_time` DATETIME COMMENT '开始时间',
    `end_time` DATETIME COMMENT '结束时间',
    `duration` INT COMMENT '学习时长（秒）',
    `progress` DECIMAL(5,2) NOT NULL DEFAULT 0 COMMENT '学习进度（%）',
    `focus_rate` DECIMAL(5,2) COMMENT '专注度',
    `interaction_count` INT NOT NULL DEFAULT 0 COMMENT '互动次数',
    `note_count` INT NOT NULL DEFAULT 0 COMMENT '笔记数量',
    `status` ENUM('IN_PROGRESS','COMPLETED','INTERRUPTED') NOT NULL DEFAULT 'IN_PROGRESS' COMMENT '状态',
    `device_type` VARCHAR(20) COMMENT '设备类型',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`record_id`),
    KEY `idx_student_course` (`student_id`, `course_id`),
    KEY `idx_chapter_id` (`chapter_id`),
    KEY `idx_learning_type` (`learning_type`),
    KEY `idx_start_time` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生学习记录表';

-- 学习路径表
CREATE TABLE `stu_learning_path` (
    `path_id` INT NOT NULL AUTO_INCREMENT COMMENT '路径ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `path_name` VARCHAR(100) NOT NULL COMMENT '路径名称',
    `path_type` ENUM('SYSTEM_RECOMMENDED','CUSTOM') COMMENT '路径类型',
    `total_nodes` INT NOT NULL DEFAULT 0 COMMENT '总节点数',
    `completed_nodes` INT NOT NULL DEFAULT 0 COMMENT '已完成节点数',
    `progress_rate` DECIMAL(5,2) NOT NULL DEFAULT 0 COMMENT '完成进度',
    `estimated_hours` DECIMAL(5,1) COMMENT '预估学时',
    `actual_hours` DECIMAL(5,1) NOT NULL DEFAULT 0 COMMENT '实际学时',
    `difficulty_level` TINYINT COMMENT '难度级别（1-5）',
    `is_active` TINYINT(1) DEFAULT 0 COMMENT '是否激活',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`path_id`),
    KEY `idx_student_course` (`student_id`, `course_id`),
    KEY `idx_path_type` (`path_type`),
    KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习路径表';

-- 错题记录表
CREATE TABLE `stu_wrong_question` (
    `wrong_id` INT NOT NULL AUTO_INCREMENT COMMENT '错题ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `question_id` INT NOT NULL COMMENT '题目ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `source_type` ENUM('HOMEWORK','EXAM','PRACTICE','CLASS_TEST') COMMENT '来源类型',
    `source_id` INT COMMENT '来源ID',
    `wrong_answer` TEXT COMMENT '错误答案',
    `correct_answer` TEXT COMMENT '正确答案',
    `wrong_reason` VARCHAR(100) COMMENT '错误原因分类',
    `knowledge_points` VARCHAR(500) COMMENT '相关知识点',
    `difficulty_level` TINYINT COMMENT '难度等级（1-5）',
    `wrong_count` INT NOT NULL DEFAULT 1 COMMENT '错误次数',
    `last_wrong_time` DATETIME COMMENT '最后错误时间',
    `is_mastered` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否已掌握',
    `master_time` DATETIME DEFAULT NULL COMMENT '掌握时间',
    `practice_count` INT NOT NULL DEFAULT 0 COMMENT '练习次数',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`wrong_id`),
    KEY `idx_student_question` (`student_id`, `question_id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_source` (`source_type`, `source_id`),
    KEY `idx_is_mastered` (`is_mastered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错题记录表';

-- 专项练习记录表
CREATE TABLE `stu_practice_record` (
    `practice_id` INT NOT NULL AUTO_INCREMENT COMMENT '练习ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `practice_type` ENUM('EXTREME','DERIVATIVE','COMPREHENSIVE','RANDOM') COMMENT '练习类型',
    `knowledge_points` VARCHAR(500) COMMENT '知识点列表',
    `difficulty_level` TINYINT COMMENT '难度等级（1-5）',
    `question_count` INT NOT NULL DEFAULT 0 COMMENT '题目总数',
    `correct_count` INT NOT NULL DEFAULT 0 COMMENT '正确数量',
    `wrong_count` INT NOT NULL DEFAULT 0 COMMENT '错误数量',
    `skipped_count` INT NOT NULL DEFAULT 0 COMMENT '跳过数量',
    `accuracy_rate` DECIMAL(5,2) COMMENT '正确率',
    `total_score` DECIMAL(5,2) COMMENT '总分',
    `earned_score` DECIMAL(5,2) COMMENT '得分',
    `start_time` DATETIME COMMENT '开始时间',
    `end_time` DATETIME COMMENT '结束时间',
    `duration` INT COMMENT '用时（秒）',
    `avg_time_per_question` DECIMAL(5,2) COMMENT '平均每题用时',
    `mastery_improvement` DECIMAL(5,2) COMMENT '掌握度提升',
    `weak_points` TEXT COMMENT '薄弱知识点',
    `suggestions` TEXT COMMENT '改进建议',
    `is_completed` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否完成',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`practice_id`),
    KEY `idx_student_course` (`student_id`, `course_id`),
    KEY `idx_practice_type` (`practice_type`),
    KEY `idx_start_time` (`start_time`),
    KEY `idx_is_completed` (`is_completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专项练习记录表';

-- 学习统计表
CREATE TABLE `stu_learning_stats` (
    `stats_id` INT NOT NULL AUTO_INCREMENT COMMENT '统计ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `course_id` INT DEFAULT NULL COMMENT '课程ID（NULL表示全部课程）',
    `stats_date` DATE NOT NULL COMMENT '统计日期',
    `stats_type` ENUM('DAY','WEEK','MONTH','SEMESTER') COMMENT '统计类型',
    `total_learning_time` INT NOT NULL DEFAULT 0 COMMENT '总学习时长（分钟）',
    `video_time` INT NOT NULL DEFAULT 0 COMMENT '视频学习时长',
    `practice_time` INT NOT NULL DEFAULT 0 COMMENT '练习时长',
    `live_time` INT NOT NULL DEFAULT 0 COMMENT '直播时长',
    `avg_focus_rate` DECIMAL(5,2) COMMENT '平均专注度',
    `login_days` INT NOT NULL DEFAULT 0 COMMENT '登录天数',
    `assignment_completed` INT NOT NULL DEFAULT 0 COMMENT '完成作业数',
    `assignment_total` INT NOT NULL DEFAULT 0 COMMENT '总作业数',
    `test_count` INT NOT NULL DEFAULT 0 COMMENT '测验次数',
    `avg_test_score` DECIMAL(5,2) COMMENT '平均测验分数',
    `interaction_count` INT NOT NULL DEFAULT 0 COMMENT '互动次数',
    `note_count` INT NOT NULL DEFAULT 0 COMMENT '笔记数量',
    `question_count` INT NOT NULL DEFAULT 0 COMMENT '提问次数',
    `mastery_improvement` DECIMAL(5,2) COMMENT '掌握度提升',
    `subject_preference` VARCHAR(255) COMMENT '学习科目偏好',
    `rank_in_class` INT COMMENT '班级排名',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`stats_id`),
    UNIQUE KEY `uk_student_date_type` (`student_id`, `stats_date`, `stats_type`, `course_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_stats_date` (`stats_date`),
    KEY `idx_stats_type` (`stats_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习统计表';

-- 学习笔记表
CREATE TABLE `stu_note` (
    `note_id` INT NOT NULL AUTO_INCREMENT COMMENT '笔记ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `chapter_id` INT COMMENT '章节ID',
    `content_type` ENUM('VIDEO','PPT','DOCUMENT','LIVE') COMMENT '内容类型',
    `note_title` VARCHAR(200) COMMENT '笔记标题',
    `note_content` TEXT NOT NULL COMMENT '笔记内容',
    `note_type` ENUM('KEY','QUESTION','SUMMARY','EXPERIENCE') COMMENT '笔记类型',
    `timestamp_seconds` INT COMMENT '时间戳（视频笔记用）',
    `page_number` INT COMMENT '页码（文档笔记用）',
    `color_code` VARCHAR(10) COMMENT '标记颜色',
    `is_shared` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否共享',
    `view_count` INT NOT NULL DEFAULT 0 COMMENT '查看次数',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`note_id`),
    KEY `idx_student_course` (`student_id`, `course_id`),
    KEY `idx_chapter_id` (`chapter_id`),
    KEY `idx_content_type` (`content_type`),
    KEY `idx_is_shared` (`is_shared`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习笔记表';

-- =============================================
-- 3. 消息管理模块
-- =============================================

-- 学生消息表
CREATE TABLE `stu_message` (
    `message_id` INT NOT NULL AUTO_INCREMENT COMMENT '消息ID',
    `student_id` INT NOT NULL COMMENT '接收学生ID',
    `sender_id` INT COMMENT '发送者ID',
    `sender_type` ENUM('SYSTEM','TEACHER','ADMIN') COMMENT '发送者类型',
    `message_type` ENUM('NOTIFICATION','HOMEWORK','SCORE','REMINDER') COMMENT '消息类型',
    `title` VARCHAR(200) NOT NULL COMMENT '消息标题',
    `content` TEXT COMMENT '消息内容',
    `attachment` VARCHAR(500) COMMENT '附件',
    `related_type` ENUM('COURSE','HOMEWORK','EXAM') COMMENT '关联类型',
    `related_id` INT COMMENT '关联ID',
    `priority` ENUM('NORMAL','IMPORTANT','URGENT') NOT NULL DEFAULT 'NORMAL' COMMENT '优先级',
    `is_read` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否已读',
    `read_time` DATETIME DEFAULT NULL COMMENT '阅读时间',
    `is_starred` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否标星',
    `is_archived` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否归档',
    `expire_time` DATETIME DEFAULT NULL COMMENT '过期时间',
    `send_time` DATETIME COMMENT '发送时间',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`message_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_sender` (`sender_id`, `sender_type`),
    KEY `idx_message_type` (`message_type`),
    KEY `idx_is_read` (`is_read`),
    KEY `idx_send_time` (`send_time`),
    KEY `idx_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生消息表';

-- =============================================
-- 4. 课程与教学基础模块
-- =============================================

-- 学期信息表
CREATE TABLE `edu_semester` (
    `semester_id` INT NOT NULL AUTO_INCREMENT COMMENT '学期ID',
    `year` INT NOT NULL COMMENT '学年（如2024）',
    `term` ENUM('SPRING','FALL') NOT NULL COMMENT '学期',
    `start_date` DATE NOT NULL COMMENT '开始日期',
    `end_date` DATE NOT NULL COMMENT '结束日期',
    `week_count` INT COMMENT '教学周数',
    `is_current` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否当前学期',
    `create_by` VARCHAR(64) COMMENT '创建者',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` VARCHAR(64) COMMENT '更新者',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`semester_id`),
    KEY `idx_year_term` (`year`, `term`),
    KEY `idx_is_current` (`is_current`),
    KEY `idx_date_range` (`start_date`, `end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学期信息表';

-- 课程信息表
CREATE TABLE `edu_course` (
    `course_id` INT NOT NULL AUTO_INCREMENT COMMENT '课程ID',
    `course_code` VARCHAR(30) NOT NULL COMMENT '课程代码',
    `course_name` VARCHAR(100) NOT NULL COMMENT '课程名称',
    `semester_id` INT NOT NULL COMMENT '学期ID',
    `dept_id` INT COMMENT '开课学院ID',
    `credit` DECIMAL(3,1) COMMENT '学分',
    `total_hours` INT COMMENT '总学时',
    `theory_hours` INT COMMENT '理论学时',
    `practice_hours` INT COMMENT '实践学时',
    `course_type` ENUM('COMPULSORY','ELECTIVE') COMMENT '课程类型',
    `description` TEXT COMMENT '课程描述',
    `outline_status` ENUM('NOT_STARTED','IN_PROGRESS','COMPLETED') NOT NULL DEFAULT 'NOT_STARTED' COMMENT '大纲完成状态',
    `resource_status` ENUM('NOT_STARTED','IN_PROGRESS','COMPLETED') NOT NULL DEFAULT 'NOT_STARTED' COMMENT '资源完成状态',
    `knowledge_status` ENUM('NOT_STARTED','IN_PROGRESS','COMPLETED') NOT NULL DEFAULT 'NOT_STARTED' COMMENT '知识图谱状态',
    `status` ENUM('NORMAL','DISABLED') NOT NULL DEFAULT 'NORMAL' COMMENT '状态',
    `create_by` VARCHAR(64) COMMENT '创建者',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` VARCHAR(64) COMMENT '更新者',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`course_id`),
    UNIQUE KEY `uk_course_code` (`course_code`),
    KEY `idx_course_name` (`course_name`),
    KEY `idx_semester_id` (`semester_id`),
    KEY `idx_dept_id` (`dept_id`),
    KEY `idx_course_type` (`course_type`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程信息表';

-- 班级信息表
CREATE TABLE `edu_class` (
    `class_id` INT NOT NULL AUTO_INCREMENT COMMENT '班级ID',
    `class_name` VARCHAR(50) NOT NULL COMMENT '班级名称',
    `class_code` VARCHAR(30) UNIQUE NOT NULL COMMENT '班级代码',
    `grade` INT COMMENT '年级',
    `dept_id` INT COMMENT '所属院系',
    `major` VARCHAR(50) COMMENT '专业',
    `student_count` INT NOT NULL DEFAULT 0 COMMENT '学生人数',
    `teacher_id` INT COMMENT '教师ID',
    `classroom_id` INT COMMENT '默认教室ID',
    `status` ENUM('NORMAL','DISABLED') NOT NULL DEFAULT 'NORMAL' COMMENT '状态',
    `create_by` VARCHAR(64) COMMENT '创建者',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` VARCHAR(64) COMMENT '更新者',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`class_id`),
    UNIQUE KEY `uk_class_code` (`class_code`),
    KEY `idx_class_name` (`class_name`),
    KEY `idx_grade` (`grade`),
    KEY `idx_dept_id` (`dept_id`),
    KEY `idx_teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级信息表';

-- 教室信息表
CREATE TABLE `edu_classroom` (
    `classroom_id` INT NOT NULL AUTO_INCREMENT COMMENT '教室ID',
    `classroom_code` VARCHAR(30) NOT NULL COMMENT '教室编号',
    `classroom_name` VARCHAR(50) NOT NULL COMMENT '教室名称',
    `building` VARCHAR(30) COMMENT '教学楼',
    `floor` INT COMMENT '楼层',
    `capacity` INT COMMENT '容纳人数',
    `equipment` VARCHAR(200) COMMENT '设备配置',
    `classroom_type` ENUM('ORDINARY','MULTIMEDIA','LAB') COMMENT '教室类型',
    `is_smart` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否智慧教室',
    `status` ENUM('AVAILABLE','OCCUPIED','MAINTENANCE') NOT NULL DEFAULT 'AVAILABLE' COMMENT '状态',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`classroom_id`),
    UNIQUE KEY `uk_classroom_code` (`classroom_code`),
    KEY `idx_building_floor` (`building`, `floor`),
    KEY `idx_classroom_type` (`classroom_type`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教室信息表';

-- 教师信息表
CREATE TABLE `edu_teacher` (
    `teacher_id` INT NOT NULL AUTO_INCREMENT COMMENT '教师ID',
    `user_id` INT NOT NULL COMMENT '用户ID（关联sys_user）',
    `teacher_no` VARCHAR(30) NOT NULL COMMENT '工号',
    `id_card` VARCHAR(18) UNIQUE NOT NULL COMMENT '身份证号',
    `title` VARCHAR(30) COMMENT '职称',
    `degree` VARCHAR(20) COMMENT '学位',
    `education` VARCHAR(20) COMMENT '学历',
    `major_field` VARCHAR(50) COMMENT '专业领域',
    `research_direction` VARCHAR(200) COMMENT '研究方向',
    `teaching_years` INT COMMENT '教龄',
    `entry_date` DATE COMMENT '入职日期',
    `employment_status` ENUM('ON_JOB','RESIGNED','RETIRED') NOT NULL DEFAULT 'ON_JOB' COMMENT '职业状态',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`teacher_id`),
    UNIQUE KEY `uk_user_id` (`user_id`),
    UNIQUE KEY `uk_teacher_no` (`teacher_no`),
    KEY `idx_employment_status` (`employment_status`),
    KEY `idx_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师信息表';

-- 教学安排表
CREATE TABLE `edu_teaching_schedule` (
    `schedule_id` INT NOT NULL AUTO_INCREMENT COMMENT '教学安排ID',
    `offering_id` INT NOT NULL COMMENT '课程开设ID',
    `schedule_type` ENUM('NORMAL','MAKEUP','ADJUST') NOT NULL DEFAULT 'NORMAL' COMMENT '类型',
    `original_schedule_id` INT COMMENT '原排课ID（调课时使用）',
    `notes` VARCHAR(500) COMMENT '备注',
    `status` ENUM('NORMAL','ADJUSTED','SUSPENDED') NOT NULL DEFAULT 'NORMAL' COMMENT '状态',
    `auto_scheduled` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否自动排课',
    `conflict_resolution` VARCHAR(100) COMMENT '冲突解决方案',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`schedule_id`),
    KEY `idx_offering_id` (`offering_id`),
    KEY `idx_schedule_type` (`schedule_type`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教学安排表';

-- 课程章节表
CREATE TABLE `edu_course_chapter` (
    `chapter_id` INT NOT NULL AUTO_INCREMENT COMMENT '章节ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `parent_id` INT NOT NULL DEFAULT 0 COMMENT '父章节ID（0表示无父章节）',
    `chapter_name` VARCHAR(100) NOT NULL COMMENT '章节名称',
    `chapter_no` VARCHAR(20) COMMENT '章节编号',
    `chapter_level` TINYINT COMMENT '章节层级',
    `learning_hours` INT COMMENT '学时数',
    `learning_objectives` TEXT COMMENT '学习目标',
    `key_points` TEXT COMMENT '重点内容',
    `difficult_points` TEXT COMMENT '难点内容',
    `sort_order` INT NOT NULL DEFAULT 0 COMMENT '排序',
    `completion_status` ENUM('NOT_STARTED','IN_PROGRESS','COMPLETED') NOT NULL DEFAULT 'NOT_STARTED' COMMENT '完成状态',
    `last_edit_time` DATETIME COMMENT '最后编辑时间',
    `status` ENUM('NORMAL','DISABLED') NOT NULL DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`chapter_id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_parent_id` (`parent_id`),
    KEY `idx_sort_order` (`sort_order`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程章节表';

-- 班级课程关联表
CREATE TABLE `edu_class_course` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `class_id` INT NOT NULL COMMENT '班级ID',
    `offering_id` INT NOT NULL COMMENT '课程开设ID',
    `course_id` INT NOT NULL COMMENT '课程ID（冗余）',
    `is_required` TINYINT(1) DEFAULT 1 COMMENT '是否必修',
    `assign_time` DATETIME COMMENT '分配时间',
    `assign_by` INT COMMENT '分配人ID',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_class_offering` (`class_id`, `offering_id`),
    KEY `idx_class_id` (`class_id`),
    KEY `idx_offering_id` (`offering_id`),
    KEY `idx_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级课程关联表';

-- 课程大纲表（基于AI）
CREATE TABLE `edu_course_outline` (
    `outline_id` INT NOT NULL AUTO_INCREMENT COMMENT '大纲ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `teacher_id` INT NOT NULL COMMENT '上传教师ID',
    `outline_name` VARCHAR(200) NOT NULL COMMENT '大纲名称',
    `original_file` VARCHAR(500) COMMENT '原始文件路径',
    `original_content` LONGTEXT COMMENT '原始文本内容',
    `parsed_content` JSON COMMENT 'AI解析后的结构化内容',
    `parse_model` VARCHAR(50) COMMENT '使用的AI模型',
    `parse_version` VARCHAR(20) COMMENT '解析版本',
    `parse_time` DATETIME DEFAULT NULL COMMENT '解析时间',
    `parse_status` ENUM('PENDING','PARSING','SUCCESS','FAILED') NOT NULL DEFAULT 'PENDING' COMMENT '解析状态',
    `error_message` TEXT COMMENT '错误信息',
    `confidence_score` DECIMAL(5,2) COMMENT 'AI解析置信度',
    `version` INT NOT NULL DEFAULT 1 COMMENT '版本号',
    `is_active` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否当前版本',
    `status` ENUM('NORMAL','DISABLED') NOT NULL DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`outline_id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_parse_status` (`parse_status`),
    KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程大纲表';

-- 知识点表
CREATE TABLE `edu_knowledge_point` (
    `point_id` INT NOT NULL AUTO_INCREMENT COMMENT '知识点ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `outline_id` INT NOT NULL COMMENT '大纲ID',
    `chapter_id` INT COMMENT '所属章节ID',
    `parent_id` INT NOT NULL DEFAULT 0 COMMENT '父知识点ID（0表示无父知识点）',
    `point_name` VARCHAR(200) NOT NULL COMMENT '知识点名称',
    `point_code` VARCHAR(50) UNIQUE NOT NULL COMMENT '知识点编码',
    `point_type` ENUM('CONCEPT','PRINCIPLE','METHOD','SKILL','CASE') COMMENT '类型',
    `difficulty_level` TINYINT COMMENT '难度等级（1-5）',
    `importance_level` TINYINT COMMENT '重要程度（1-5）',
    `cognitive_level` ENUM('KNOW','UNDERSTAND','APPLY','ANALYZE','SYNTHESIZE','EVALUATE') COMMENT '认知层次',
    `learning_hours` DECIMAL(4,1) COMMENT '建议学时',
    `prerequisite_points` VARCHAR(500) COMMENT '前置知识点ID列表',
    `related_points` VARCHAR(500) COMMENT '相关知识点ID列表',
    `learning_objectives` TEXT COMMENT '学习目标',
    `key_words` VARCHAR(500) COMMENT '关键词',
    `description` TEXT COMMENT '详细描述',
    `examples` TEXT COMMENT '示例说明',
    `sort_order` INT NOT NULL DEFAULT 0 COMMENT '排序',
    `ai_extracted` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否AI提取',
    `extraction_confidence` DECIMAL(5,2) COMMENT '提取置信度',
    `status` ENUM('NORMAL','DISABLED') NOT NULL DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`point_id`),
    KEY `idx_course_outline` (`course_id`, `outline_id`),
    KEY `idx_chapter_id` (`chapter_id`),
    KEY `idx_parent_id` (`parent_id`),
    KEY `idx_point_type` (`point_type`),
    KEY `idx_difficulty` (`difficulty_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='知识点表';

-- =============================================
-- 5. 备课管理模块（基于AI）
-- =============================================

-- 教案表
CREATE TABLE `prep_lesson_plan` (
    `plan_id` INT NOT NULL AUTO_INCREMENT COMMENT '教案ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `chapter_id` INT COMMENT '章节ID',
    `teacher_id` INT NOT NULL COMMENT '教师ID',
    `title` VARCHAR(200) NOT NULL COMMENT '教案标题',
    `objectives` TEXT COMMENT '教学目标',
    `key_points` TEXT COMMENT '重点内容',
    `difficult_points` TEXT COMMENT '难点内容',
    `teaching_methods` TEXT COMMENT '教学方法',
    `content` LONGTEXT COMMENT '教案内容',
    `homework` TEXT COMMENT '作业布置',
    `reflection` TEXT COMMENT '教学反思',
    `word_count` INT NOT NULL DEFAULT 0 COMMENT '字数统计',
    `ai_generated` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否AI生成',
    `status` ENUM('DRAFT','COMPLETED','REVIEWED') NOT NULL DEFAULT 'DRAFT' COMMENT '状态',
    `version` INT NOT NULL DEFAULT 1 COMMENT '版本号',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`plan_id`),
    KEY `idx_course_chapter` (`course_id`, `chapter_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教案表';

-- PPT课件表
CREATE TABLE `prep_ppt` (
    `ppt_id` INT NOT NULL AUTO_INCREMENT COMMENT 'PPT ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `chapter_id` INT COMMENT '章节ID',
    `teacher_id` INT NOT NULL COMMENT '教师ID',
    `title` VARCHAR(200) NOT NULL COMMENT 'PPT标题',
    `file_path` VARCHAR(500) COMMENT '文件路径',
    `file_size` INT COMMENT '文件大小（字节）',
    `slide_count` INT NOT NULL DEFAULT 0 COMMENT '幻灯片数量',
    `theme_style` VARCHAR(50) COMMENT '主题样式',
    `animation_config` JSON COMMENT '动画配置',
    `thumbnail` VARCHAR(200) COMMENT '缩略图路径',
    `version` INT NOT NULL DEFAULT 1 COMMENT '版本号',
    `status` ENUM('NORMAL','DISABLED') NOT NULL DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`ppt_id`),
    KEY `idx_course_chapter` (`course_id`, `chapter_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='PPT课件表';

-- 微课视频表
CREATE TABLE `prep_video` (
    `video_id` INT NOT NULL AUTO_INCREMENT COMMENT '视频ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `chapter_id` INT COMMENT '章节ID',
    `teacher_id` INT NOT NULL COMMENT '教师ID',
    `title` VARCHAR(200) NOT NULL COMMENT '视频标题',
    `description` TEXT COMMENT '视频描述',
    `file_path` VARCHAR(500) COMMENT '文件路径',
    `file_size` INT COMMENT '文件大小（字节）',
    `duration` INT COMMENT '时长（秒）',
    `resolution` VARCHAR(20) COMMENT '分辨率',
    `format` VARCHAR(20) COMMENT '视频格式',
    `thumbnail` VARCHAR(200) COMMENT '缩略图路径',
    `view_count` INT NOT NULL DEFAULT 0 COMMENT '观看次数',
    `status` ENUM('NORMAL','DISABLED') NOT NULL DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    `delete_time` DATETIME COMMENT '删除时间',
    PRIMARY KEY (`video_id`),
    KEY `idx_course_chapter` (`course_id`, `chapter_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微课视频表';

-- 题库表
CREATE TABLE `prep_question_bank` (
    `question_id` INT NOT NULL AUTO_INCREMENT COMMENT '题目ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `chapter_id` INT COMMENT '章节ID',
    `question_type` ENUM('SINGLE','MULTIPLE','JUDGE','BLANK','ESSAY') NOT NULL DEFAULT 'SINGLE' COMMENT '题型',
    `difficulty` ENUM('VERY_EASY','EASY','MEDIUM','HARD','VERY_HARD') DEFAULT 'MEDIUM' COMMENT '难度',
    `question_text` TEXT NOT NULL COMMENT '题目内容',
    `options` JSON COMMENT '选项（JSON格式）',
    `answer` TEXT NOT NULL COMMENT '答案',
    `analysis` TEXT COMMENT '解析',
    `score` DECIMAL(5,2) COMMENT '分值',
    `knowledge_points` VARCHAR(500) COMMENT '知识点',
    `correct_rate` DECIMAL(5,2) COMMENT '正确率',
    `ai_generated` TINYINT(1) DEFAULT 0 COMMENT '是否AI生成',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '状态',
    `create_by` VARCHAR(64) COMMENT '创建者',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`question_id`),
    KEY `idx_course_chapter` (`course_id`, `chapter_id`),
    KEY `idx_question_type` (`question_type`),
    KEY `idx_difficulty` (`difficulty`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='题库表';

-- 试卷表
CREATE TABLE `prep_test_paper` (
    `paper_id` INT NOT NULL AUTO_INCREMENT COMMENT '试卷ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `teacher_id` INT NOT NULL COMMENT '创建教师ID',
    `paper_name` VARCHAR(200) NOT NULL COMMENT '试卷名称',
    `paper_type` ENUM('PRACTICE','QUIZ','EXAM','CLASS_TEST') COMMENT '试卷类型',
    `total_score` DECIMAL(5,2) DEFAULT 100 COMMENT '总分',
    `pass_score` DECIMAL(5,2) DEFAULT 60 COMMENT '及格分',
    `exam_duration` INT COMMENT '考试时长（分钟）',
    `question_count` INT DEFAULT 0 COMMENT '题目数量',
    `difficulty_level` ENUM('VERY_EASY','EASY','MEDIUM','HARD','VERY_HARD') COMMENT '难度等级',
    `instructions` TEXT COMMENT '考试说明',
    `ai_generated` TINYINT(1) DEFAULT 0 COMMENT '是否AI生成',
    `status` ENUM('DRAFT','PUBLISHED') DEFAULT 'DRAFT' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `session_id` INT COMMENT '课堂会话ID',
    `offering_id` INT COMMENT '课程开设ID',
    `time_limit` INT COMMENT '时间限制（分钟）',
    `auto_grade` TINYINT(1) DEFAULT 1 COMMENT '是否自动批改',
    `immediate_feedback` TINYINT(1) DEFAULT 0 COMMENT '是否即时反馈',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`paper_id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_paper_type` (`paper_type`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷表';

-- 试卷题目关联表
CREATE TABLE `prep_test_question` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `paper_id` INT NOT NULL COMMENT '试卷ID',
    `question_id` INT NOT NULL COMMENT '题目ID',
    `question_no` INT COMMENT '题目序号',
    `score` DECIMAL(5,2) COMMENT '题目分值',
    `sort_order` INT DEFAULT 0 COMMENT '排序',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_paper_question` (`paper_id`, `question_id`),
    KEY `idx_paper_id` (`paper_id`),
    KEY `idx_question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷题目关联表';

-- 备课资源表
CREATE TABLE `prep_resource` (
    `resource_id` INT NOT NULL AUTO_INCREMENT COMMENT '资源ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `chapter_id` INT COMMENT '章节ID',
    `teacher_id` INT NOT NULL COMMENT '上传教师ID',
    `resource_name` VARCHAR(200) NOT NULL COMMENT '资源名称',
    `resource_type` ENUM('PPT','VIDEO','DOC','AUDIO','IMAGE','OTHER') COMMENT '资源类型',
    `file_path` VARCHAR(500) COMMENT '文件路径',
    `file_size` INT COMMENT '文件大小',
    `format` VARCHAR(20) COMMENT '文件格式',
    `description` TEXT COMMENT '资源描述',
    `copyright_status` ENUM('PENDING','ORIGINAL','AUTHORIZED','PUBLIC') DEFAULT 'PENDING' COMMENT '版权状态',
    `use_count` INT DEFAULT 0 COMMENT '使用次数',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`resource_id`),
    KEY `idx_course_chapter` (`course_id`, `chapter_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_resource_type` (`resource_type`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='备课资源表';

-- =============================================
-- 6. 课堂教学模块
-- =============================================

-- 课堂会话表
CREATE TABLE `class_session` (
    `session_id` INT NOT NULL AUTO_INCREMENT COMMENT '会话ID',
    `schedule_id` INT NOT NULL COMMENT '排课ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `class_id` INT NOT NULL COMMENT '班级ID',
    `teacher_id` INT NOT NULL COMMENT '教师ID',
    `classroom_id` INT COMMENT '教室ID',
    `session_date` DATE NOT NULL COMMENT '上课日期',
    `start_time` DATETIME COMMENT '开始时间',
    `end_time` DATETIME COMMENT '结束时间',
    `actual_duration` INT COMMENT '实际时长(分钟)',
    `student_count` INT COMMENT '应到人数',
    `actual_count` INT COMMENT '实到人数',
    `late_count` INT COMMENT '迟到人数',
    `leave_early_count` INT COMMENT '早退人数',
    `absence_count` INT COMMENT '缺席人数',
    `interaction_count` INT COMMENT '互动次数',
    `avg_focus_rate` DECIMAL(5,2) COMMENT '平均专注度',
    `danmu_count` INT DEFAULT 0 COMMENT '弹幕数量',
    `status` ENUM('NOT_STARTED','ONGOING','ENDED') DEFAULT 'NOT_STARTED' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `session_recording` VARCHAR(255) COMMENT '课堂录制文件路径',
    `replay_count` INT DEFAULT 0 COMMENT '回放观看次数',
    `live_stream_url` VARCHAR(500) COMMENT '直播流地址',
    `monitoring_enabled` TINYINT(1) DEFAULT 1 COMMENT '是否开启监控',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`session_id`),
    KEY `idx_schedule_id` (`schedule_id`),
    KEY `idx_course_class` (`course_id`, `class_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_session_date` (`session_date`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课堂会话表';

-- 签到记录表
CREATE TABLE `class_attendance` (
    `attendance_id` INT NOT NULL AUTO_INCREMENT COMMENT '签到ID',
    `session_id` INT NOT NULL COMMENT '课堂会话ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `sign_type` ENUM('QRCODE','ROLLCALL','LOCATION','FACE') COMMENT '签到方式',
    `sign_time` DATETIME COMMENT '签到时间',
    `sign_location` VARCHAR(100) COMMENT '签到位置',
    `device_info` VARCHAR(200) COMMENT '设备信息',
    `seat_no` VARCHAR(20) COMMENT '座位号',
    `status` ENUM('ABSENT','NORMAL','LATE','EARLY_LEAVE','LEAVE') COMMENT '状态',
    `leave_type` ENUM('SICK','PERSONAL','PUBLIC','OTHER') COMMENT '请假类型',
    `remark` VARCHAR(200) COMMENT '备注',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`attendance_id`),
    UNIQUE KEY `uk_session_student` (`session_id`, `student_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_sign_time` (`sign_time`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到记录表';

-- 课堂互动记录表
CREATE TABLE `class_interaction` (
    `interaction_id` INT NOT NULL AUTO_INCREMENT COMMENT '互动ID',
    `session_id` INT NOT NULL COMMENT '课堂会话ID',
    `interaction_type` ENUM('DANMU','RUSH_ANSWER','VOTE','QUIZ','GROUP') NOT NULL DEFAULT 'DANMU' COMMENT '互动类型',
    `title` VARCHAR(200) COMMENT '互动标题',
    `content` TEXT COMMENT '互动内容',
    `options` JSON COMMENT '选项（JSON格式）',
    `start_time` DATETIME COMMENT '开始时间',
    `end_time` DATETIME COMMENT '结束时间',
    `time_limit` INT COMMENT '时间限制（秒）',
    `participant_count` INT DEFAULT 0 COMMENT '参与人数',
    `reward_score` DECIMAL(5,2) COMMENT '奖励分数',
    `reward_limit` INT COMMENT '奖励人数上限',
    `result_data` JSON COMMENT '结果数据',
    `status` ENUM('NOT_STARTED','ONGOING','ENDED') COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`interaction_id`),
    KEY `idx_session_id` (`session_id`),
    KEY `idx_interaction_type` (`interaction_type`),
    KEY `idx_start_time` (`start_time`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课堂互动记录表';

-- 测验答题记录表
CREATE TABLE `class_quiz_answer` (
    `answer_id` INT NOT NULL AUTO_INCREMENT COMMENT '答题ID',
    `quiz_id` INT NOT NULL COMMENT '测验ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `question_id` INT NOT NULL COMMENT '题目ID',
    `student_answer` TEXT COMMENT '学生答案',
    `is_correct` ENUM('WRONG','CORRECT','PARTIAL') COMMENT '是否正确',
    `score` DECIMAL(5,2) COMMENT '得分',
    `answer_time` DATETIME COMMENT '答题时间',
    `time_spent` INT COMMENT '用时（秒）',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`answer_id`),
    UNIQUE KEY `uk_quiz_student_question` (`quiz_id`, `student_id`, `question_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_question_id` (`question_id`),
    KEY `idx_is_correct` (`is_correct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测验答题记录表';

-- 弹幕记录表
CREATE TABLE `class_danmu` (
    `danmu_id` INT NOT NULL AUTO_INCREMENT COMMENT '弹幕ID',
    `session_id` INT NOT NULL COMMENT '课堂会话ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `content` VARCHAR(500) NOT NULL COMMENT '弹幕内容',
    `send_time` DATETIME COMMENT '发送时间',
    `position_x` INT COMMENT '显示位置X',
    `position_y` INT COMMENT '显示位置Y',
    `color` VARCHAR(20) COMMENT '颜色',
    `font_size` INT COMMENT '字体大小',
    `is_anonymous` TINYINT(1) DEFAULT 0 COMMENT '是否匿名',
    `status` ENUM('NORMAL','BLOCKED') DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`danmu_id`),
    KEY `idx_session_id` (`session_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_send_time` (`send_time`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='弹幕记录表';

-- 课堂录制表
CREATE TABLE `class_recording` (
    `recording_id` INT NOT NULL AUTO_INCREMENT COMMENT '录制ID',
    `session_id` INT NOT NULL COMMENT '课堂会话ID',
    `file_path` VARCHAR(500) COMMENT '文件路径',
    `file_size` INT COMMENT '文件大小',
    `duration` INT COMMENT '时长（秒）',
    `format` VARCHAR(20) COMMENT '录制格式',
    `resolution` VARCHAR(20) COMMENT '分辨率',
    `start_time` DATETIME COMMENT '开始时间',
    `end_time` DATETIME COMMENT '结束时间',
    `view_count` INT DEFAULT 0 COMMENT '观看次数',
    `status` ENUM('RECORDING','PROCESSING','COMPLETED','FAILED') DEFAULT 'RECORDING' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`recording_id`),
    KEY `idx_session_id` (`session_id`),
    KEY `idx_status` (`status`),
    KEY `idx_start_time` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课堂录制表';

-- =============================================
-- 7. 作业评阅模块
-- =============================================

-- 作业布置表
CREATE TABLE `eval_assignment` (
    `assignment_id` INT NOT NULL AUTO_INCREMENT COMMENT '作业ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `class_ids` VARCHAR(500) COMMENT '班级ID列表',
    `teacher_id` INT NOT NULL COMMENT '布置教师ID',
    `title` VARCHAR(200) NOT NULL COMMENT '作业标题',
    `description` TEXT COMMENT '作业描述',
    `requirements` TEXT COMMENT '作业要求',
    `attachment` VARCHAR(500) COMMENT '附件路径',
    `assignment_type` ENUM('REGULAR','EXPERIMENT','REPORT') COMMENT '作业类型',
    `total_score` DECIMAL(5,2) DEFAULT 100 COMMENT '总分',
    `start_time` DATETIME NOT NULL COMMENT '开始时间',
    `end_time` DATETIME NOT NULL COMMENT '截止时间',
    `late_submit_allowed` TINYINT(1) DEFAULT 0 COMMENT '是否允许迟交',
    `student_count` INT DEFAULT 0 COMMENT '应交人数',
    `submit_count` INT DEFAULT 0 COMMENT '已提交数',
    `graded_count` INT DEFAULT 0 COMMENT '已批改数',
    `avg_score` DECIMAL(5,2) COMMENT '平均分',
    `max_score` DECIMAL(5,2) COMMENT '最高分',
    `min_score` DECIMAL(5,2) COMMENT '最低分',
    `status` ENUM('DRAFT','PUBLISHED','GRADING','COMPLETED') COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`assignment_id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_start_end_time` (`start_time`, `end_time`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作业布置表';

-- 做题提交表（总表）
CREATE TABLE `eval_submission` (
    `submission_id` INT NOT NULL AUTO_INCREMENT COMMENT '提交ID',
    `assignment_id` INT NOT NULL COMMENT '作业ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `attachment` VARCHAR(500) COMMENT '附件路径',
    `submit_time` DATETIME COMMENT '提交时间',
    `is_late` TINYINT(1) DEFAULT 0 COMMENT '是否迟交',
    `submit_count` INT DEFAULT 1 COMMENT '提交次数',
    `ip_address` VARCHAR(50) COMMENT '提交IP',
    `device_info` VARCHAR(200) COMMENT '设备信息',
    `status` ENUM('NOT_SUBMITTED','SUBMITTED','GRADING','GRADED','RETURNED') COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `self_evaluation` TEXT COMMENT '学生自评',
    `learning_reflection` TEXT COMMENT '学习反思',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`submission_id`),
    UNIQUE KEY `uk_assignment_student` (`assignment_id`, `student_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_submit_time` (`submit_time`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='做题提交表';

-- 作业答题详情表
CREATE TABLE `eval_submission_detail` (
    `detail_id` INT NOT NULL AUTO_INCREMENT COMMENT '详情ID',
    `submission_id` INT NOT NULL COMMENT '提交ID',
    `question_id` INT NOT NULL COMMENT '题目ID',
    `question_no` INT COMMENT '题号',
    `student_answer` TEXT COMMENT '学生答案',
    `answer_attachment` VARCHAR(500) COMMENT '答案附件',
    `is_correct` ENUM('WRONG','CORRECT','PARTIAL') DEFAULT NULL COMMENT '是否正确',
    `score` DECIMAL(5,2) COMMENT '得分',
    `max_score` DECIMAL(5,2) COMMENT '满分值',
    `teacher_comment` TEXT COMMENT '教师批注',
    `ai_feedback` TEXT COMMENT 'AI反馈',
    `answer_time` DATETIME COMMENT '答题时间',
    `time_spent` INT COMMENT '答题用时（秒）',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`detail_id`),
    KEY `idx_submission_id` (`submission_id`),
    KEY `idx_question_id` (`question_id`),
    KEY `idx_is_correct` (`is_correct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作业答题详情表';

-- 作业批改表
CREATE TABLE `eval_grading` (
    `grading_id` INT NOT NULL AUTO_INCREMENT COMMENT '批改ID',
    `submission_id` INT NOT NULL UNIQUE COMMENT '提交ID',
    `grader_id` INT NOT NULL COMMENT '批改教师ID',
    `score` DECIMAL(5,2) COMMENT '得分',
    `comment` TEXT COMMENT '批改评语',
    `detailed_feedback` JSON COMMENT '详细反馈',
    `strengths` TEXT COMMENT '优点',
    `weaknesses` TEXT COMMENT '不足',
    `suggestions` TEXT COMMENT '改进建议',
    `grading_time` DATETIME COMMENT '批改时间',
    `ai_assisted` TINYINT(1) DEFAULT 0 COMMENT '是否AI辅助',
    `plagiarism_rate` DECIMAL(5,2) COMMENT '重复率',
    `status` ENUM('PENDING','GRADED') DEFAULT 'PENDING' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`grading_id`),
    KEY `idx_submission_id` (`submission_id`),
    KEY `idx_grader_id` (`grader_id`),
    KEY `idx_grading_time` (`grading_time`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作业批改表';

-- 成绩申诉表
CREATE TABLE `eval_appeal` (
    `appeal_id` INT NOT NULL AUTO_INCREMENT COMMENT '申诉ID',
    `submission_id` INT NOT NULL COMMENT '作业提交ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `appeal_type` ENUM('SCORE','GRADING','OTHER') COMMENT '申诉类型',
    `appeal_reason` TEXT NOT NULL COMMENT '申诉标题',
    `appeal_content` TEXT COMMENT '申诉内容',
    `attachment` VARCHAR(500) COMMENT '附件',
    `original_score` DECIMAL(5,2) COMMENT '原始分数',
    `adjusted_score` DECIMAL(5,2) COMMENT '调整后分数',
    `teacher_id` INT COMMENT '教师ID',
    `handle_time` DATETIME COMMENT '处理时间',
    `handle_result` TEXT COMMENT '处理结果',
    `status` ENUM('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`appeal_id`),
    KEY `idx_submission_id` (`submission_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='成绩申诉表';

-- 雷同检测表
CREATE TABLE `eval_plagiarism` (
    `plagiarism_id` INT NOT NULL AUTO_INCREMENT COMMENT '检测ID',
    `assignment_id` INT NOT NULL COMMENT '作业ID',
    `submission_id1` INT NOT NULL COMMENT '提交ID1',
    `submission_id2` INT NOT NULL COMMENT '提交ID2',
    `student_id1` INT NOT NULL COMMENT '学生ID1',
    `student_id2` INT NOT NULL COMMENT '学生ID2',
    `similarity_rate` DECIMAL(5,2) COMMENT '相似度',
    `matched_content` TEXT COMMENT '匹配内容',
    `detection_time` DATETIME COMMENT '检测时间',
    `is_confirmed` TINYINT(1) DEFAULT 0 COMMENT '是否确认抄袭',
    `teacher_id` INT COMMENT '教师ID',
    `handle_time` DATETIME COMMENT '处理时间',
    `handle_result` VARCHAR(200) COMMENT '处理结果',
    `status` ENUM('PENDING','IGNORED','CONFIRMED') DEFAULT 'PENDING' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`plagiarism_id`),
    KEY `idx_assignment_id` (`assignment_id`),
    KEY `idx_submissions` (`submission_id1`, `submission_id2`),
    KEY `idx_students` (`student_id1`, `student_id2`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='雷同检测表';

-- =============================================
-- 8. 教学分析模块
-- =============================================

-- 成绩记录表
CREATE TABLE `analysis_score` (
    `score_id` INT NOT NULL AUTO_INCREMENT COMMENT '成绩ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `semester_id` INT NOT NULL COMMENT '学期ID',
    `score_type` ENUM('REGULAR','MIDTERM','FINAL','TOTAL') COMMENT '成绩类型',
    `regular_score` DECIMAL(5,2) COMMENT '平时成绩',
    `midterm_score` DECIMAL(5,2) COMMENT '期中成绩',
    `final_score` DECIMAL(5,2) COMMENT '期末成绩',
    `total_score` DECIMAL(5,2) COMMENT '总评成绩',
    `grade_point` DECIMAL(3,2) COMMENT '绩点',
    `rank_class` INT COMMENT '班级排名',
    `rank_grade` INT COMMENT '年级排名',
    `is_pass` TINYINT(1) COMMENT '是否及格',
    `is_excellent` TINYINT(1) COMMENT '是否优秀',
    `attendance_rate` DECIMAL(5,2) COMMENT '出勤率',
    `homework_rate` DECIMAL(5,2) COMMENT '作业完成率',
    `remark` VARCHAR(500) COMMENT '备注',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`score_id`),
    UNIQUE KEY `uk_student_course_semester` (`student_id`, `course_id`, `semester_id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_semester_id` (`semester_id`),
    KEY `idx_score_type` (`score_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='成绩记录表';

-- 学生学情画像表
CREATE TABLE `analysis_student_profile` (
    `profile_id` INT NOT NULL AUTO_INCREMENT COMMENT '画像ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `learning_style` VARCHAR(50) COMMENT '学习风格',
    `knowledge_mastery` JSON COMMENT '知识点掌握情况',
    `strength_points` TEXT COMMENT '优势知识点',
    `weak_points` TEXT COMMENT '薄弱知识点',
    `avg_score` DECIMAL(5,2) COMMENT '平均成绩',
    `score_trend` ENUM('RISING','STABLE','DECLINING') COMMENT '成绩趋势',
    `participation_level` ENUM('HIGH','MEDIUM','LOW') COMMENT '参与度等级',
    `focus_level` ENUM('HIGH','MEDIUM','LOW') COMMENT '专注度等级',
    `risk_level` ENUM('NO_RISK','LOW','MEDIUM','HIGH') COMMENT '风险等级',
    `tags` VARCHAR(500) COMMENT '标签',
    `suggestions` TEXT COMMENT '学习建议',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`profile_id`),
    UNIQUE KEY `uk_student_course` (`student_id`, `course_id`),
    KEY `idx_score_trend` (`score_trend`),
    KEY `idx_risk_level` (`risk_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生学情画像表';

-- 班级统计表
CREATE TABLE `analysis_class_stats` (
    `stats_id` INT NOT NULL AUTO_INCREMENT COMMENT '统计ID',
    `class_id` INT NOT NULL COMMENT '班级ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `semester_id` INT NOT NULL COMMENT '学期ID',
    `student_count` INT COMMENT '学生总数',
    `avg_score` DECIMAL(5,2) COMMENT '平均分',
    `max_score` DECIMAL(5,2) COMMENT '最高分',
    `min_score` DECIMAL(5,2) COMMENT '最低分',
    `excellent_count` INT COMMENT '优秀人数',
    `excellent_rate` DECIMAL(5,2) COMMENT '优秀率',
    `pass_count` INT COMMENT '及格人数',
    `pass_rate` DECIMAL(5,2) COMMENT '及格率',
    `fail_count` INT COMMENT '不及格人数',
    `attendance_rate` DECIMAL(5,2) COMMENT '出勤率',
    `homework_rate` DECIMAL(5,2) COMMENT '作业完成率',
    `participation_rate` DECIMAL(5,2) COMMENT '课堂参与度',
    `stats_date` DATE COMMENT '统计日期',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`stats_id`),
    KEY `idx_class_course` (`class_id`, `course_id`),
    KEY `idx_semester_id` (`semester_id`),
    KEY `idx_stats_date` (`stats_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级统计表';

-- 题目质量分析表
CREATE TABLE `analysis_question_quality` (
    `analysis_id` INT NOT NULL AUTO_INCREMENT COMMENT '分析ID',
    `question_id` INT NOT NULL COMMENT '题目ID',
    `paper_id` INT COMMENT '试卷ID',
    `answer_count` INT DEFAULT 0 COMMENT '作答人数',
    `correct_count` INT DEFAULT 0 COMMENT '正确人数',
    `correct_rate` DECIMAL(5,2) COMMENT '正确率',
    `avg_score` DECIMAL(5,2) COMMENT '平均得分',
    `difficulty_actual` DECIMAL(5,2) COMMENT '实际难度',
    `discrimination` DECIMAL(5,2) COMMENT '区分度',
    `reliability` DECIMAL(5,2) COMMENT '信度',
    `common_errors` JSON COMMENT '常见错误',
    `error_analysis` TEXT COMMENT '错误分析',
    `improvement_suggestions` TEXT COMMENT '改进建议',
    `analysis_time` DATETIME COMMENT '分析时间',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`analysis_id`),
    KEY `idx_question_id` (`question_id`),
    KEY `idx_paper_id` (`paper_id`),
    KEY `idx_correct_rate` (`correct_rate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='题目质量分析表';

-- 教学改进建议表
CREATE TABLE `analysis_suggestion` (
    `suggestion_id` INT NOT NULL AUTO_INCREMENT COMMENT '建议ID',
    `course_id` INT NOT NULL COMMENT '课程ID',
    `class_id` INT COMMENT '班级ID',
    `teacher_id` INT NOT NULL COMMENT '教师ID',
    `suggestion_type` ENUM('TEACHING_METHOD','CONTENT','INTERACTION','ASSESSMENT','OTHER') COMMENT '建议类型',
    `title` VARCHAR(200) COMMENT '建议标题',
    `content` TEXT COMMENT '建议内容',
    `knowledge_points` VARCHAR(500) COMMENT '相关知识点',
    `teaching_methods` TEXT COMMENT '教学方法建议',
    `resource_links` TEXT COMMENT '资源链接',
    `priority` ENUM('LOWEST','LOW','MEDIUM','HIGH','HIGHEST') COMMENT '优先级',
    `is_adopted` TINYINT(1) DEFAULT 0 COMMENT '是否采纳',
    `adopt_time` DATETIME COMMENT '采纳时间',
    `ai_generated` TINYINT(1) DEFAULT 0 COMMENT '是否AI生成',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`suggestion_id`),
    KEY `idx_course_class` (`course_id`, `class_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_suggestion_type` (`suggestion_type`),
    KEY `idx_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教学改进建议表';

-- =============================================
-- 9. 资源管理模块
-- =============================================

-- 统一资源库表
CREATE TABLE `resource_library` (
    `resource_id` INT NOT NULL AUTO_INCREMENT COMMENT '资源ID',
    `resource_name` VARCHAR(200) NOT NULL COMMENT '资源名称',
    `resource_type` ENUM('PPT','VIDEO','DOC','QUESTION','COURSEWARE','OTHER') COMMENT '资源类型',
    `resource_source` ENUM('PREP','SHARE','SYSTEM','EXTERNAL') COMMENT '资源来源',
    `category_id` INT COMMENT '分类ID',
    `course_id` INT COMMENT '关联课程ID',
    `chapter_id` INT COMMENT '关联章节ID',
    `dept_id` INT COMMENT '所属学院ID',
    `file_path` VARCHAR(500) COMMENT '文件路径',
    `file_size` INT COMMENT '文件大小（字节）',
    `file_format` VARCHAR(20) COMMENT '文件格式',
    `thumbnail` VARCHAR(200) COMMENT '缩略图',
    `description` TEXT COMMENT '资源描述',
    `tags` VARCHAR(500) COMMENT '标签',
    `knowledge_points` VARCHAR(500) COMMENT '关联知识点',
    `download_count` INT DEFAULT 0 COMMENT '下载次数',
    `view_count` INT DEFAULT 0 COMMENT '浏览次数',
    `use_count` INT DEFAULT 0 COMMENT '教学使用次数',
    `favorite_count` INT DEFAULT 0 COMMENT '收藏次数',
    `rating_score` DECIMAL(3,2) COMMENT '评分',
    `rating_count` INT DEFAULT 0 COMMENT '评价人数',
    `copyright_info` VARCHAR(200) COMMENT '版权信息',
    `share_scope` ENUM('PRIVATE','CLASS','DEPT','SCHOOL','PUBLIC') DEFAULT 'PRIVATE' COMMENT '共享范围',
    `upload_by` INT COMMENT '上传者ID',
    `owner_type` ENUM('TEACHER','STUDENT','SYSTEM') COMMENT '所有者类型',
    `is_original` TINYINT(1) DEFAULT 1 COMMENT '是否原创',
    `source_url` VARCHAR(500) COMMENT '外部资源URL',
    `audit_status` ENUM('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING' COMMENT '审核状态',
    `audit_by` INT COMMENT '审核人ID',
    `audit_time` DATETIME COMMENT '审核时间',
    `status` ENUM('NORMAL','OFFLINE','DELETED') DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`resource_id`),
    KEY `idx_resource_type` (`resource_type`),
    KEY `idx_category_id` (`category_id`),
    KEY `idx_course_chapter` (`course_id`, `chapter_id`),
    KEY `idx_share_scope` (`share_scope`),
    KEY `idx_audit_status` (`audit_status`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='统一资源库表';

-- 资源分类表
CREATE TABLE `resource_category` (
    `category_id` INT NOT NULL AUTO_INCREMENT COMMENT '分类ID',
    `category_name` VARCHAR(50) NOT NULL UNIQUE COMMENT '分类名称',
    `parent_id` INT DEFAULT 0 COMMENT '父分类ID',
    `category_path` VARCHAR(200) COMMENT '分类路径',
    `level` TINYINT COMMENT '层级',
    `sort_order` INT DEFAULT 0 COMMENT '排序',
    `description` VARCHAR(500) COMMENT '描述',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`category_id`),
    KEY `idx_parent_id` (`parent_id`),
    KEY `idx_sort_order` (`sort_order`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源分类表';

-- 资源收藏表
CREATE TABLE `resource_favorite` (
    `favorite_id` INT NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
    `resource_id` INT NOT NULL COMMENT '资源ID',
    `user_id` INT NOT NULL COMMENT '用户ID',
    `folder_name` VARCHAR(50) COMMENT '收藏夹名称',
    `tags` VARCHAR(200) COMMENT '个人标签',
    `notes` VARCHAR(500) COMMENT '备注',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`favorite_id`),
    UNIQUE KEY `uk_resource_user` (`resource_id`, `user_id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_folder_name` (`folder_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源收藏表';

-- 下载记录表
CREATE TABLE `resource_download` (
    `download_id` INT NOT NULL AUTO_INCREMENT COMMENT '下载ID',
    `resource_id` INT NOT NULL COMMENT '资源ID',
    `user_id` INT NOT NULL COMMENT '用户ID',
    `download_time` DATETIME COMMENT '下载时间',
    `status` ENUM('SUCCESS','FAILED') COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`download_id`),
    KEY `idx_resource_id` (`resource_id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_download_time` (`download_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='下载记录表';

-- 浏览历史表
CREATE TABLE `resource_view_history` (
    `history_id` INT NOT NULL AUTO_INCREMENT COMMENT '历史ID',
    `resource_id` INT NOT NULL COMMENT '资源ID',
    `user_id` INT NOT NULL COMMENT '用户ID',
    `view_time` DATETIME COMMENT '浏览时间',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`history_id`),
    KEY `idx_resource_user` (`resource_id`, `user_id`),
    KEY `idx_view_time` (`view_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='浏览历史表';

-- =============================================
-- 10. 其他业务模块
-- =============================================

-- 通知公告表
CREATE TABLE `sys_notification` (
    `notice_id` INT NOT NULL AUTO_INCREMENT COMMENT '通知ID',
    `notice_title` VARCHAR(200) NOT NULL COMMENT '通知标题',
    `notice_type` ENUM('SYSTEM','TEACHING','ASSIGNMENT','EXAM') COMMENT '通知类型',
    `notice_content` TEXT COMMENT '通知内容',
    `priority` ENUM('NORMAL','IMPORTANT','URGENT') DEFAULT 'NORMAL' COMMENT '优先级',
    `target_type` ENUM('ALL','TEACHER','STUDENT','CLASS','INDIVIDUAL') COMMENT '目标类型',
    `target_ids` TEXT COMMENT '目标ID列表',
    `sender_id` INT COMMENT '发送者ID',
    `send_time` DATETIME COMMENT '发送时间',
    `expire_time` DATETIME COMMENT '过期时间',
    `read_count` INT DEFAULT 0 COMMENT '已读人数',
    `total_count` INT DEFAULT 0 COMMENT '总人数',
    `is_top` TINYINT(1) DEFAULT 0 COMMENT '是否置顶',
    `attachment` VARCHAR(500) COMMENT '附件',
    `status` ENUM('DRAFT','SENT','RECALLED') DEFAULT 'DRAFT' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`notice_id`),
    KEY `idx_notice_type` (`notice_type`),
    KEY `idx_target_type` (`target_type`),
    KEY `idx_send_time` (`send_time`),
    KEY `idx_priority` (`priority`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- 待办事项表
CREATE TABLE `sys_todo` (
    `todo_id` INT NOT NULL AUTO_INCREMENT COMMENT '待办ID',
    `user_id` INT NOT NULL COMMENT '用户ID',
    `title` VARCHAR(200) NOT NULL COMMENT '待办标题',
    `content` TEXT COMMENT '待办内容',
    `todo_type` ENUM('TEACHING','GRADING','MEETING','OTHER') COMMENT '待办类型',
    `priority` ENUM('LOW','MEDIUM','HIGH') DEFAULT 'MEDIUM' COMMENT '优先级',
    `deadline` DATETIME COMMENT '截止时间',
    `remind_time` DATETIME COMMENT '提醒时间',
    `is_completed` TINYINT(1) DEFAULT 0 COMMENT '是否完成',
    `complete_time` DATETIME COMMENT '完成时间',
    `source_type` ENUM('SYSTEM','MANUAL','AUTO') COMMENT '来源类型',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`todo_id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_todo_type` (`todo_type`),
    KEY `idx_deadline` (`deadline`),
    KEY `idx_is_completed` (`is_completed`),
    KEY `idx_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='待办事项表';

-- 学生反馈表
CREATE TABLE `edu_feedback` (
    `feedback_id` INT NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
    `student_id` INT NOT NULL COMMENT '学生ID',
    `teacher_id` INT NOT NULL COMMENT '教师ID',
    `course_id` INT COMMENT '课程ID',
    `feedback_type` ENUM('TEACHING','ASSIGNMENT','COURSE','OTHER') COMMENT '反馈类型',
    `rating` ENUM('STAR_1','STAR_2','STAR_3','STAR_4','STAR_5') COMMENT '评分',
    `title` VARCHAR(200) COMMENT '反馈标题',
    `content` TEXT COMMENT '反馈内容',
    `tags` VARCHAR(200) COMMENT '反馈标签',
    `attachment` VARCHAR(500) COMMENT '附件',
    `is_anonymous` TINYINT(1) DEFAULT 0 COMMENT '是否匿名',
    `is_read` TINYINT(1) DEFAULT 0 COMMENT '是否已读',
    `status` ENUM('PENDING','REPLIED','CLOSED') DEFAULT 'PENDING' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`feedback_id`),
    KEY `idx_student_id` (`student_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_feedback_type` (`feedback_type`),
    KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生反馈表';

-- 教师画像表
CREATE TABLE `edu_teacher_profile` (
    `profile_id` INT NOT NULL AUTO_INCREMENT COMMENT '画像ID',
    `teacher_id` INT NOT NULL UNIQUE COMMENT '教师ID',
    `teaching_ability` DECIMAL(5,2) COMMENT '教学能力评分',
    `interaction_ability` DECIMAL(5,2) COMMENT '互动能力评分',
    `innovation_ability` DECIMAL(5,2) COMMENT '创新能力评分',
    `research_ability` DECIMAL(5,2) COMMENT '科研能力评分',
    `overall_rating` DECIMAL(5,2) COMMENT '综合评分',
    `teaching_style` VARCHAR(100) COMMENT '教学风格',
    `expertise_areas` VARCHAR(500) COMMENT '擅长领域',
    `achievements` TEXT COMMENT '主要成就',
    `development_stage` ENUM('NOVICE','DEVELOPING','PROFICIENT','EXPERT') COMMENT '发展阶段',
    `student_satisfaction` DECIMAL(5,2) COMMENT '学生满意度',
    `strengths` TEXT COMMENT '优势分析',
    `improvement_areas` TEXT COMMENT '改进方向',
    `development_plan` TEXT COMMENT '发展计划',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`profile_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_development_stage` (`development_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师画像表';

-- 教师成长记录表
CREATE TABLE `edu_teacher_growth` (
    `growth_id` INT NOT NULL AUTO_INCREMENT COMMENT '记录ID',
    `teacher_id` INT NOT NULL COMMENT '教师ID',
    `record_type` ENUM('TRAINING','AWARD','RESEARCH','OPEN_CLASS') COMMENT '记录类型',
    `title` VARCHAR(200) NOT NULL COMMENT '标题',
    `description` TEXT COMMENT '描述',
    `organizer` VARCHAR(100) COMMENT '组织单位',
    `location` VARCHAR(200) COMMENT '地点',
    `start_date` DATE COMMENT '开始日期',
    `end_date` DATE COMMENT '结束日期',
    `certificate_no` VARCHAR(50) UNIQUE NOT NULL COMMENT '证书编号',
    `certificate_file` VARCHAR(500) COMMENT '证书文件',
    `credit_hours` DECIMAL(5,1) COMMENT '学时/学分',
    `achievement_level` ENUM('NATIONAL','PROVINCIAL','CITY','DISTRICT','SCHOOL') COMMENT '成就等级',
    `reflection` TEXT COMMENT '心得体会',
    `attachment` VARCHAR(500) COMMENT '附件',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '状态',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `delete_time` DATETIME COMMENT '删除时间',
    `is_delete` TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    PRIMARY KEY (`growth_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_record_type` (`record_type`),
    KEY `idx_achievement_level` (`achievement_level`),
    KEY `idx_start_date` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师成长记录表';