-- 一、系统基础模块（RBAC核心表）
-- 1. sys_user（用户信息表）
CREATE TABLE sys_user (
    user_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
    dept_id INT COMMENT '所属部门ID（统一部门归属）',
    user_name VARCHAR(30) NOT NULL UNIQUE COMMENT '用户账号',
    nick_name VARCHAR(30) NOT NULL COMMENT '用户昵称（显示名称）',
    real_name VARCHAR(30) COMMENT '真实姓名（正式姓名）',
    user_type ENUM('SYSTEM','TEACHER','STUDENT') DEFAULT 'SYSTEM' COMMENT '用户类型',
    email VARCHAR(50) COMMENT '用户邮箱',
    phone VARCHAR(11) COMMENT '手机号码',
    gender ENUM('MALE','FEMALE','UNKNOWN') DEFAULT 'UNKNOWN' COMMENT '性别',
    birth_date DATE COMMENT '出生日期',
    avatar VARCHAR(100) COMMENT '头像地址',
    `password` VARCHAR(100) COMMENT '密码',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '帐号状态',
    login_ip VARCHAR(128) COMMENT '最后登录IP',
    login_date DATETIME COMMENT '最后登录时间',
    create_by VARCHAR(64) COMMENT '创建者',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_by VARCHAR(64) COMMENT '更新者',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    remark VARCHAR(500) COMMENT '备注',
    learning_preference VARCHAR(100) COMMENT '学习偏好设置',
    focus_time_preference VARCHAR(50) COMMENT '专注时间偏好',
    notification_settings JSON COMMENT '通知设置',
    privacy_settings JSON COMMENT '隐私设置',
    password_expire_time DATETIME COMMENT '密码过期时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='用户信息表';

CREATE INDEX idx_dept_id ON sys_user(dept_id);
CREATE INDEX idx_user_type ON sys_user(user_type);
CREATE INDEX idx_email ON sys_user(email);
CREATE INDEX idx_phone ON sys_user(phone);
CREATE INDEX idx_status ON sys_user(status);
CREATE INDEX idx_is_delete ON sys_user(is_delete);

-- 2. sys_role（角色信息表）
CREATE TABLE sys_role (
    role_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '角色ID',
    role_name VARCHAR(30) NOT NULL COMMENT '角色名称',
    role_key VARCHAR(100) NOT NULL UNIQUE COMMENT '角色权限字符串',
    role_sort INT NOT NULL DEFAULT 0 COMMENT '显示顺序',
    data_scope ENUM('ALL','CUSTOM','DEPT','DEPT_BELOW') DEFAULT 'ALL' COMMENT '数据范围',
    menu_check_strictly TINYINT(1) DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
    dept_check_strictly TINYINT(1) DEFAULT 1 COMMENT '部门树选择项是否关联显示',
    `status` ENUM('NORMAL','DISABLED') NOT NULL DEFAULT 'NORMAL' COMMENT '角色状态',
    create_by VARCHAR(64) COMMENT '创建者',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_by VARCHAR(64) COMMENT '更新者',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    remark VARCHAR(500) COMMENT '备注',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='角色信息表';

CREATE INDEX idx_status ON sys_role(status);
CREATE INDEX idx_is_delete ON sys_role(is_delete);

-- 3. sys_menu（菜单权限表）
CREATE TABLE sys_menu (
    menu_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '菜单ID',
    menu_name VARCHAR(50) NOT NULL COMMENT '菜单名称',
    parent_id INT DEFAULT 0 COMMENT '父菜单ID',
    order_num INT DEFAULT 0 COMMENT '显示顺序',
    `path` VARCHAR(200) COMMENT '路由地址',
    component VARCHAR(255) COMMENT '组件路径',
    query VARCHAR(255) COMMENT '路由参数',
    is_frame TINYINT(1) DEFAULT 0 COMMENT '是否为外链（0-否,1-是）',
    is_cache TINYINT(1) DEFAULT 1 COMMENT '是否缓存（0-不缓存,1-缓存）',
    menu_type ENUM('DIR','MENU','BUTTON') DEFAULT 'MENU' COMMENT '菜单类型',
    visible ENUM('SHOW','HIDE') DEFAULT 'SHOW' COMMENT '菜单状态',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '菜单状态',
    perms VARCHAR(100) COMMENT '权限标识',
    icon VARCHAR(100) DEFAULT '#' COMMENT '菜单图标',
    create_by VARCHAR(64) COMMENT '创建者',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_by VARCHAR(64) COMMENT '更新者',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    remark VARCHAR(500) COMMENT '备注',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='菜单权限表';

CREATE INDEX idx_parent_id ON sys_menu(parent_id);
CREATE INDEX idx_menu_type ON sys_menu(menu_type);
CREATE INDEX idx_status ON sys_menu(status);
CREATE INDEX idx_is_delete ON sys_menu(is_delete);

-- 4. sys_dept（部门组织表）
CREATE TABLE sys_dept (
    dept_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '部门id',
    parent_id INT DEFAULT 0 COMMENT '父部门id',
    ancestors VARCHAR(50) COMMENT '祖级列表',
    dept_name VARCHAR(30) COMMENT '部门名称',
    order_num INT DEFAULT 0 COMMENT '显示顺序',
    leader VARCHAR(20) COMMENT '负责人',
    phone VARCHAR(11) COMMENT '联系电话',
    email VARCHAR(50) COMMENT '邮箱',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '部门状态',
    create_by VARCHAR(64) COMMENT '创建者',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_by VARCHAR(64) COMMENT '更新者',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='部门组织表';

CREATE INDEX idx_parent_id ON sys_dept(parent_id);
CREATE INDEX idx_status ON sys_dept(status);
CREATE INDEX idx_is_delete ON sys_dept(is_delete);

-- 5. sys_user_role（用户角色关联表）
CREATE TABLE sys_user_role (
    user_id INT NOT NULL COMMENT '用户ID',
    role_id INT NOT NULL COMMENT '角色ID',
    PRIMARY KEY (user_id, role_id)
) COMMENT='用户角色关联表';

-- 6. sys_role_menu（角色菜单权限关联表）
CREATE TABLE sys_role_menu (
    role_id INT NOT NULL COMMENT '角色ID',
    menu_id INT NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (role_id, menu_id)
) COMMENT='角色菜单权限关联表';

-- 7. sys_role_dept（角色部门权限表）
CREATE TABLE sys_role_dept (
    role_id INT NOT NULL COMMENT '角色ID',
    dept_id INT NOT NULL COMMENT '部门ID',
    PRIMARY KEY (role_id, dept_id)
) COMMENT='角色部门权限表';

-- 8. sys_oper_log（操作日志表）
CREATE TABLE sys_oper_log (
    oper_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '日志主键',
    title VARCHAR(50) COMMENT '模块标题',
    business_type ENUM('OTHER','INSERT','UPDATE','DELETE') DEFAULT 'OTHER' COMMENT '业务类型',
    method VARCHAR(100) COMMENT '方法名称',
    request_method VARCHAR(10) COMMENT '请求方式',
    operator_type ENUM('OTHER','BACKEND','MOBILE') DEFAULT 'OTHER' COMMENT '操作类别',
    oper_name VARCHAR(50) COMMENT '操作人员',
    dept_name VARCHAR(50) COMMENT '部门名称',
    oper_url VARCHAR(255) COMMENT '请求URL',
    oper_ip VARCHAR(128) COMMENT '主机地址',
    oper_location VARCHAR(255) COMMENT '操作地点',
    oper_param VARCHAR(2000) COMMENT '请求参数',
    json_result VARCHAR(2000) COMMENT '返回参数',
    `status` ENUM('SUCCESS','ERROR') DEFAULT 'SUCCESS' COMMENT '操作状态',
    error_msg VARCHAR(2000) COMMENT '错误消息',
    update_by VARCHAR(64) COMMENT '更新者',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='操作日志表';

CREATE INDEX idx_business_type ON sys_oper_log(business_type);
CREATE INDEX idx_oper_name ON sys_oper_log(oper_name);
CREATE INDEX idx_status ON sys_oper_log(status);
CREATE INDEX idx_create_time ON sys_oper_log(create_time);
CREATE INDEX idx_is_delete ON sys_oper_log(is_delete);

-- 9. sys_login_log（登录日志表）
CREATE TABLE sys_login_log (
    info_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '访问ID',
    user_name VARCHAR(50) COMMENT '用户账号',
    ipaddr VARCHAR(128) COMMENT '登录IP地址',
    login_location VARCHAR(255) COMMENT '登录地点',
    browser VARCHAR(50) COMMENT '浏览器类型',
    os VARCHAR(50) COMMENT '操作系统',
    `status` ENUM('SUCCESS','FAILED') DEFAULT 'SUCCESS' COMMENT '登录状态',
    msg VARCHAR(255) COMMENT '提示消息',
    login_time DATETIME COMMENT '访问时间',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='登录日志表';

CREATE INDEX idx_user_name ON sys_login_log(user_name);
CREATE INDEX idx_status ON sys_login_log(status);
CREATE INDEX idx_login_time ON sys_login_log(login_time);
CREATE INDEX idx_is_delete ON sys_login_log(is_delete);

-- 10. sys_dict_type（字典类型表）
CREATE TABLE sys_dict_type (
    dict_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '字典主键',
    dict_name VARCHAR(100) COMMENT '字典名称',
    dict_type VARCHAR(100) COMMENT '字典类型',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '状态',
    create_by VARCHAR(64) COMMENT '创建者',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_by VARCHAR(64) COMMENT '更新者',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    remark VARCHAR(500) COMMENT '备注',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='字典类型表';

CREATE INDEX idx_dict_type ON sys_dict_type(dict_type);
CREATE INDEX idx_status ON sys_dict_type(status);
CREATE INDEX idx_is_delete ON sys_dict_type(is_delete);

-- 11. sys_dict_data（字典数据表）
CREATE TABLE sys_dict_data (
    dict_code INT AUTO_INCREMENT PRIMARY KEY COMMENT '字典编码',
    dict_sort INT DEFAULT 0 COMMENT '字典排序',
    dict_label VARCHAR(100) COMMENT '字典标签',
    dict_value VARCHAR(100) COMMENT '字典键值',
    dict_type VARCHAR(100) COMMENT '字典类型',
    css_class VARCHAR(100) COMMENT '样式属性',
    list_class VARCHAR(100) COMMENT '表格回显样式',
    is_default TINYINT(1) DEFAULT 0 COMMENT '是否默认（0-否,1-是）',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '状态',
    create_by VARCHAR(64) COMMENT '创建者',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_by VARCHAR(64) COMMENT '更新者',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    remark VARCHAR(500) COMMENT '备注',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='字典数据表';

CREATE INDEX idx_dict_type ON sys_dict_data(dict_type);
CREATE INDEX idx_status ON sys_dict_data(status);
CREATE INDEX idx_is_delete ON sys_dict_data(is_delete);

-- 二、管理监控模块
-- 2.1 排课考务管理
-- 1. edu_teacher_preference（教师偏好调研表）
CREATE TABLE edu_teacher_preference (
    preference_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '偏好ID',
    teacher_id INT NOT NULL COMMENT '教师ID',
    semester_id INT NOT NULL COMMENT '学期ID',
    preferred_time_slots JSON COMMENT '偏好时间段（JSON格式）',
    avoided_time_slots JSON COMMENT '避免时间段',
    preferred_classrooms VARCHAR(500) COMMENT '偏好教室ID列表',
    max_daily_hours INT COMMENT '每日最大课时',
    max_continuous_hours INT COMMENT '最大连续课时',
    rest_time_required INT COMMENT '所需休息时间（分钟）',
    special_requirements TEXT COMMENT '特殊要求说明',
    submit_time DATETIME COMMENT '提交时间',
    `status` ENUM('PENDING','SUBMITTED') NOT NULL DEFAULT 'PENDING' COMMENT '状态',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='教师偏好调研表';

CREATE INDEX idx_teacher_id ON edu_teacher_preference(teacher_id);
CREATE INDEX idx_semester_id ON edu_teacher_preference(semester_id);
CREATE INDEX idx_status ON edu_teacher_preference(status);
CREATE INDEX idx_is_delete ON edu_teacher_preference(is_delete);
CREATE INDEX idx_teacher_semester ON edu_teacher_preference(teacher_id, semester_id);

-- 2. edu_exam_arrangement（考试安排表）
CREATE TABLE edu_exam_arrangement (
    arrangement_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '安排ID',
    course_id INT NOT NULL COMMENT '课程ID',
    exam_name VARCHAR(200) NOT NULL COMMENT '考试名称',
    exam_type ENUM('MID_TERM','FINAL','MAKEUP') COMMENT '考试类型',
    exam_date DATE NOT NULL COMMENT '考试日期',
    start_time TIME NOT NULL COMMENT '开始时间',
    end_time TIME NOT NULL COMMENT '结束时间',
    duration INT COMMENT '考试时长（分钟）',
    classroom_list JSON COMMENT '考场安排（JSON）',
    invigilator_list JSON COMMENT '监考安排（JSON）',
    student_list JSON COMMENT '考生安排（JSON）',
    total_students INT DEFAULT 0 COMMENT '考生总数',
    arrangement_rules JSON COMMENT '安排规则配置',
    is_published TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否发布（0-未发布,1-已发布）',
    publish_time DATETIME COMMENT '发布时间',
    create_by INT COMMENT '创建人ID',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='考试安排表';

CREATE INDEX idx_course_id ON edu_exam_arrangement(course_id);
CREATE INDEX idx_exam_date ON edu_exam_arrangement(exam_date);
CREATE INDEX idx_exam_type ON edu_exam_arrangement(exam_type);
CREATE INDEX idx_is_published ON edu_exam_arrangement(is_published);
CREATE INDEX idx_is_delete ON edu_exam_arrangement(is_delete);
CREATE INDEX idx_course_date ON edu_exam_arrangement(course_id, exam_date);

-- 2.2 在线巡堂管理
-- 1. patrol_classroom_monitor（课堂监控记录表）
CREATE TABLE patrol_classroom_monitor (
    monitor_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '监控ID',
    session_id INT NOT NULL COMMENT '课堂会话ID',
    monitor_time DATETIME NOT NULL COMMENT '监控时间',
    online_student_count INT DEFAULT 0 COMMENT '在线学生数',
    attendance_rate DECIMAL(5,2) COMMENT '出勤率',
    interaction_count INT DEFAULT 0 COMMENT '互动次数',
    avg_focus_rate DECIMAL(5,2) COMMENT '平均专注度',
    audio_status TINYINT(1) NOT NULL DEFAULT 0 COMMENT '音频是否开启（0-未开启,1-已开启）',
    video_status TINYINT(1) NOT NULL DEFAULT 0 COMMENT '摄像头是否开启（0-未开启,1-已开启）',
    recording_status TINYINT(1) NOT NULL DEFAULT 0 COMMENT '录制是否开启（0-未开启,1-已开启）',
    alert_count INT DEFAULT 0 COMMENT '异常次数',
    quality_score DECIMAL(5,2) COMMENT '课堂质量分数',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='课堂监控记录表';

CREATE INDEX idx_session_id ON patrol_classroom_monitor(session_id);
CREATE INDEX idx_monitor_time ON patrol_classroom_monitor(monitor_time);
CREATE INDEX idx_is_delete ON patrol_classroom_monitor(is_delete);

-- 2. patrol_inspection_record（巡查记录表）
CREATE TABLE patrol_inspection_record (
    inspection_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '巡查ID',
    inspector_id INT NOT NULL COMMENT '巡查人ID',
    session_id INT COMMENT '课堂会话ID',
    inspection_type ENUM('REGULAR','RANDOM','EXCEPTION') NOT NULL DEFAULT 'REGULAR' COMMENT '巡查类型',
    inspection_time DATETIME NOT NULL COMMENT '巡查时间',
    duration INT COMMENT '巡查时长（分钟）',
    classroom_status VARCHAR(20) COMMENT '课堂状态评估',
    teacher_performance VARCHAR(20) COMMENT '教师表现评估',
    student_engagement VARCHAR(20) COMMENT '学生参与度评估',
    technical_issues TEXT COMMENT '技术问题记录',
    suggestions TEXT COMMENT '改进建议',
    alert_level ENUM('ATTENTION','WARNING','SEVERE') COMMENT '预警级别',
    follow_up_required TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否需要跟进（0-否，1-是）',
    follow_up_time DATETIME COMMENT '跟进时间',
    `status` ENUM('PENDING','RECORDED') NOT NULL DEFAULT 'PENDING' COMMENT '记录状态',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='巡查记录表';

CREATE INDEX idx_inspector_id ON patrol_inspection_record(inspector_id);
CREATE INDEX idx_session_id ON patrol_inspection_record(session_id);
CREATE INDEX idx_inspection_type ON patrol_inspection_record(inspection_type);
CREATE INDEX idx_inspection_time ON patrol_inspection_record(inspection_time);
CREATE INDEX idx_status ON patrol_inspection_record(status);
CREATE INDEX idx_is_delete ON patrol_inspection_record(is_delete);

-- 3. patrol_classroom_alert（课堂异常预警表）
CREATE TABLE patrol_classroom_alert (
    alert_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '预警ID',
    session_id INT NOT NULL COMMENT '课堂会话ID',
    alert_type ENUM('ATTENDANCE','FOCUS','TECH') NOT NULL COMMENT '预警类型',
    alert_level ENUM('MILD','MODERATE','SEVERE') COMMENT '预警级别',
    alert_time DATETIME NOT NULL COMMENT '预警时间',
    alert_content TEXT COMMENT '预警内容描述',
    trigger_data JSON COMMENT '触发数据（JSON）',
    threshold_value DECIMAL(10,2) COMMENT '阈值',
    actual_value DECIMAL(10,2) COMMENT '实际值',
    is_handled TINYINT(1) DEFAULT 0 COMMENT '是否已处理（0-未处理，1-已处理）',
    handler_id INT COMMENT '处理人ID',
    handle_time DATETIME COMMENT '处理时间',
    handle_result VARCHAR(200) COMMENT '处理结果',
    auto_generated TINYINT(1) DEFAULT 0 COMMENT '是否系统自动生成（0-否，1-是）',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='课堂异常预警表';

CREATE INDEX idx_session_id ON patrol_classroom_alert(session_id);
CREATE INDEX idx_alert_type ON patrol_classroom_alert(alert_type);
CREATE INDEX idx_alert_level ON patrol_classroom_alert(alert_level);
CREATE INDEX idx_alert_time ON patrol_classroom_alert(alert_time);
CREATE INDEX idx_is_handled ON patrol_classroom_alert(is_handled);
CREATE INDEX idx_is_delete ON patrol_classroom_alert(is_delete);

-- 2.3 质量监测分析
-- 1. quality_fail_risk_prediction（挂科风险预测表）
CREATE TABLE quality_fail_risk_prediction (
    prediction_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '预测ID',
    student_id INT NOT NULL COMMENT '学生ID',
    course_id INT NOT NULL COMMENT '课程ID',
    semester_id INT NOT NULL COMMENT '学期ID',
    prediction_date DATE NOT NULL COMMENT '预测日期',
    risk_score DECIMAL(5,2) COMMENT '风险分数（0-100）',
    risk_level ENUM('LOW','MEDIUM','HIGH') COMMENT '风险等级',
    risk_factors JSON COMMENT '风险因子分析',
    attendance_score DECIMAL(5,2) COMMENT '出勤情况得分',
    homework_score DECIMAL(5,2) COMMENT '作业情况得分',
    test_score DECIMAL(5,2) COMMENT '测验情况得分',
    interaction_score DECIMAL(5,2) COMMENT '互动情况得分',
    learning_behavior_score DECIMAL(5,2) COMMENT '学习行为得分',
    historical_performance DECIMAL(5,2) COMMENT '历史成绩表现',
    early_warning_sent TINYINT(1) DEFAULT 0 COMMENT '是否已发送预警（0-否，1-是）',
    intervention_suggested TEXT COMMENT '干预建议',
    prediction_accuracy DECIMAL(5,2) COMMENT '预测准确率',
    model_version VARCHAR(20) COMMENT '模型版本',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='挂科风险预测表';

CREATE INDEX idx_student_id ON quality_fail_risk_prediction(student_id);
CREATE INDEX idx_course_id ON quality_fail_risk_prediction(course_id);
CREATE INDEX idx_semester_id ON quality_fail_risk_prediction(semester_id);
CREATE INDEX idx_prediction_date ON quality_fail_risk_prediction(prediction_date);
CREATE INDEX idx_risk_level ON quality_fail_risk_prediction(risk_level);
CREATE INDEX idx_is_delete ON quality_fail_risk_prediction(is_delete);
CREATE INDEX idx_student_course_semester ON quality_fail_risk_prediction(student_id, course_id, semester_id);

-- 2. quality_course_goal_achievement（课程目标达成度表）
CREATE TABLE quality_course_goal_achievement (
    achievement_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '达成度ID',
    course_id INT NOT NULL COMMENT '课程ID',
    class_id INT COMMENT '班级ID',
    semester_id INT NOT NULL COMMENT '学期ID',
    goal_name VARCHAR(200) NOT NULL COMMENT '目标名称',
    goal_description TEXT COMMENT '目标描述',
    target_value DECIMAL(5,2) COMMENT '目标值',
    actual_value DECIMAL(5,2) COMMENT '实际值',
    achievement_rate DECIMAL(5,2) COMMENT '达成率',
    evaluation_method VARCHAR(50) COMMENT '评价方法',
    assessment_data JSON COMMENT '评估数据来源',
    student_count INT COMMENT '参与学生数',
    pass_count INT COMMENT '达标学生数',
    analysis_report TEXT COMMENT '分析报告',
    improvement_suggestions TEXT COMMENT '改进建议',
    analysis_date DATE COMMENT '分析日期',
    analyzer_id INT COMMENT '分析人ID',
    `status` ENUM('PENDING','COMPLETED') DEFAULT 'PENDING' COMMENT '状态',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='课程目标达成度表';

CREATE INDEX idx_course_id ON quality_course_goal_achievement(course_id);
CREATE INDEX idx_class_id ON quality_course_goal_achievement(class_id);
CREATE INDEX idx_semester_id ON quality_course_goal_achievement(semester_id);
CREATE INDEX idx_analysis_date ON quality_course_goal_achievement(analysis_date);
CREATE INDEX idx_status ON quality_course_goal_achievement(status);
CREATE INDEX idx_is_delete ON quality_course_goal_achievement(is_delete);

-- 2.4 教师绩效管理
-- 1. performance_evaluation_cycle（绩效评估周期表）
CREATE TABLE performance_evaluation_cycle (
    cycle_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '周期ID',
    cycle_name VARCHAR(100) NOT NULL COMMENT '周期名称',
    evaluation_type ENUM('SEMESTER','YEAR') COMMENT '评估类型',
    `start_date` DATE NOT NULL COMMENT '开始日期',
    end_date DATE NOT NULL COMMENT '结束日期',
    submission_deadline DATE COMMENT '提交截止日期',
    evaluation_deadline DATE COMMENT '评估截止日期',
    target_teachers JSON COMMENT '目标教师范围',
    evaluation_dimensions JSON COMMENT '评估维度配置',
    weight_config JSON COMMENT '权重配置',
    is_active TINYINT(1) DEFAULT 0 COMMENT '是否激活（0-未激活，1-已激活）',
    completion_rate DECIMAL(5,2) DEFAULT 0 COMMENT '完成率',
    create_by INT COMMENT '创建人',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='绩效评估周期表';

CREATE INDEX idx_evaluation_type ON performance_evaluation_cycle(evaluation_type);
CREATE INDEX idx_start_date ON performance_evaluation_cycle(start_date);
CREATE INDEX idx_end_date ON performance_evaluation_cycle(end_date);
CREATE INDEX idx_is_active ON performance_evaluation_cycle(is_active);
CREATE INDEX idx_is_delete ON performance_evaluation_cycle(is_delete);

-- 2. performance_department_stats（院系绩效统计表）
CREATE TABLE performance_department_stats (
    stats_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '统计ID',
    dept_id INT NOT NULL COMMENT '院系ID',
    cycle_id INT NOT NULL COMMENT '评估周期ID',
    total_teachers INT DEFAULT 0 COMMENT '教师总数',
    evaluated_teachers INT DEFAULT 0 COMMENT '已评估教师数',
    avg_score DECIMAL(5,2) COMMENT '平均分',
    excellent_count INT DEFAULT 0 COMMENT '优秀人数',
    good_count INT DEFAULT 0 COMMENT '良好人数',
    qualified_count INT DEFAULT 0 COMMENT '合格人数',
    unqualified_count INT DEFAULT 0 COMMENT '不合格人数',
    excellent_rate DECIMAL(5,2) COMMENT '优秀率',
    ranking INT COMMENT '院系排名',
    teaching_quality_avg DECIMAL(5,2) COMMENT '教学质量平均分',
    research_ability_avg DECIMAL(5,2) COMMENT '科研能力平均分',
    service_contribution_avg DECIMAL(5,2) COMMENT '服务贡献平均分',
    stats_date DATE COMMENT '统计日期',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='院系绩效统计表';

CREATE INDEX idx_dept_id ON performance_department_stats(dept_id);
CREATE INDEX idx_cycle_id ON performance_department_stats(cycle_id);
CREATE INDEX idx_stats_date ON performance_department_stats(stats_date);
CREATE INDEX idx_is_delete ON performance_department_stats(is_delete);
CREATE INDEX idx_dept_cycle ON performance_department_stats(dept_id, cycle_id);

-- 2.5 系统配置管理
-- 1. sys_config_params（系统参数配置表）
CREATE TABLE sys_config_params (
    config_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '配置ID',
    config_category ENUM('SYSTEM','TEACHING','EVALUATION','NOTIFICATION') NOT NULL COMMENT '配置分类',
    config_key VARCHAR(100) NOT NULL UNIQUE COMMENT '配置键',
    config_value TEXT COMMENT '配置值',
    config_type ENUM('STRING','INT','BOOL','DATETIME') DEFAULT 'STRING' COMMENT '数据类型',
    config_desc VARCHAR(500) COMMENT '配置描述',
    is_encrypted TINYINT(1) DEFAULT 0 COMMENT '是否加密存储（0-否，1-是）',
    is_system TINYINT(1) DEFAULT 0 COMMENT '是否系统内置（0-否，1-是）',
    validation_rule VARCHAR(200) COMMENT '验证规则',
    sort_order INT DEFAULT 0 COMMENT '排序',
    `status` ENUM('ENABLED','DISABLED') DEFAULT 'ENABLED' COMMENT '状态',
    create_by VARCHAR(64) COMMENT '创建者',
    create_time DATETIME COMMENT '创建时间',
    update_by VARCHAR(64) COMMENT '更新者',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='系统参数配置表';

CREATE INDEX idx_config_category ON sys_config_params(config_category);
CREATE INDEX idx_status ON sys_config_params(status);
CREATE INDEX idx_is_delete ON sys_config_params(is_delete);

-- 2.9 管理员专用
-- 1. sys_admin_profile（管理员档案表）
CREATE TABLE sys_admin_profile (
    profile_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '档案ID',
    user_id INT NOT NULL UNIQUE COMMENT '用户ID（关联sys_user）',
    admin_type ENUM('SYSTEM','TEACHING','DEPARTMENT') COMMENT '管理员类型',
    management_scope JSON COMMENT '管理范围配置',
    authorized_modules VARCHAR(500) COMMENT '授权模块列表',
    work_hours VARCHAR(100) COMMENT '工作时间',
    contact_info JSON COMMENT '联系方式',
    emergency_contact VARCHAR(100) COMMENT '紧急联系人',
    certification_info TEXT COMMENT '资质信息',
    training_records JSON COMMENT '培训记录',
    performance_rating DECIMAL(5,2) COMMENT '绩效评级',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='管理员档案表';

CREATE INDEX idx_admin_type ON sys_admin_profile(admin_type);
CREATE INDEX idx_is_delete ON sys_admin_profile(is_delete);

-- 2. scheduling_algorithm_config（排课算法配置表）
CREATE TABLE scheduling_algorithm_config (
    config_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '配置ID',
    semester_id INT NOT NULL COMMENT '学期ID',
    config_name VARCHAR(100) NOT NULL COMMENT '配置名称',
    algorithm_type ENUM('GENETIC','SIMULATED_ANNEALING','GREEDY') COMMENT '算法类型',
    weight_config JSON COMMENT '权重配置',
    constraint_rules JSON COMMENT '约束规则',
    time_slot_config JSON COMMENT '时间段配置',
    classroom_priority JSON COMMENT '教室优先级',
    teacher_workload_limit JSON COMMENT '教师工作量限制',
    optimization_target VARCHAR(50) COMMENT '优化目标',
    is_active TINYINT(1) DEFAULT 1 COMMENT '是否启用（0-禁用，1-启用）',
    create_by INT COMMENT '创建人',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='排课算法配置表';

CREATE INDEX idx_semester_id ON scheduling_algorithm_config(semester_id);
CREATE INDEX idx_algorithm_type ON scheduling_algorithm_config(algorithm_type);
CREATE INDEX idx_is_active ON scheduling_algorithm_config(is_active);
CREATE INDEX idx_is_delete ON scheduling_algorithm_config(is_delete);

-- 3. teacher_performance_detail（教师绩效详情表）
CREATE TABLE teacher_performance_detail (
    detail_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '详情ID',
    teacher_id INT NOT NULL COMMENT '教师ID',
    cycle_id INT NOT NULL COMMENT '评估周期ID',
    teaching_quality_score DECIMAL(5,2) COMMENT '教学质量得分',
    student_feedback_score DECIMAL(5,2) COMMENT '学生反馈得分',
    peer_evaluation_score DECIMAL(5,2) COMMENT '同行评价得分',
    research_output_score DECIMAL(5,2) COMMENT '科研产出得分',
    service_contribution_score DECIMAL(5,2) COMMENT '服务贡献得分',
    innovation_ability_score DECIMAL(5,2) COMMENT '创新能力得分',
    total_score DECIMAL(5,2) COMMENT '总分',
    performance_level ENUM('EXCELLENT','GOOD','QUALIFIED','UNQUALIFIED') COMMENT '绩效等级',
    improvement_plan TEXT COMMENT '改进计划',
    evaluator_id INT COMMENT '评估人ID',
    evaluation_date DATE COMMENT '评估日期',
    `status` ENUM('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING' COMMENT '状态',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='教师绩效详情表';

CREATE INDEX idx_teacher_id ON teacher_performance_detail(teacher_id);
CREATE INDEX idx_cycle_id ON teacher_performance_detail(cycle_id);
CREATE INDEX idx_performance_level ON teacher_performance_detail(performance_level);
CREATE INDEX idx_evaluation_date ON teacher_performance_detail(evaluation_date);
CREATE INDEX idx_status ON teacher_performance_detail(status);
CREATE INDEX idx_is_delete ON teacher_performance_detail(is_delete);
CREATE INDEX idx_teacher_cycle ON teacher_performance_detail(teacher_id, cycle_id);

-- 2.10 权限审计
-- 1. sys_permission_audit（权限操作审计表）
CREATE TABLE sys_permission_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '审计ID',
    operator_id INT NOT NULL COMMENT '操作人ID',
    target_user_id INT COMMENT '目标用户ID',
    operation_type ENUM('GRANT','REVOKE','ROLE_CHANGE') COMMENT '操作类型',
    permission_code VARCHAR(100) COMMENT '权限代码',
    old_value TEXT COMMENT '原值',
    new_value TEXT COMMENT '新值',
    operation_reason VARCHAR(500) COMMENT '操作原因',
    ip_address VARCHAR(50) COMMENT '操作IP',
    user_agent VARCHAR(200) COMMENT '用户代理',
    operation_result ENUM('SUCCESS','FAIL') COMMENT '操作结果',
    error_message VARCHAR(500) COMMENT '错误信息',
    operation_time DATETIME COMMENT '操作时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='权限操作审计表';

CREATE INDEX idx_operator_id ON sys_permission_audit(operator_id);
CREATE INDEX idx_target_user_id ON sys_permission_audit(target_user_id);
CREATE INDEX idx_operation_type ON sys_permission_audit(operation_type);
CREATE INDEX idx_operation_time ON sys_permission_audit(operation_time);
CREATE INDEX idx_operation_result ON sys_permission_audit(operation_result);
CREATE INDEX idx_is_delete ON sys_permission_audit(is_delete);

-- 三、教学管理模块
-- 1. edu_course_offering（课程开设表）
CREATE TABLE edu_course_offering (
    offering_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '开设ID',
    course_id INT NOT NULL COMMENT '课程ID',
    teacher_id INT COMMENT '主讲教师ID',
    semester_id INT COMMENT '学期ID',
    class_id INT COMMENT '班级ID',
    class_name VARCHAR(100) NOT NULL COMMENT '教学班名称',
    classroom_id INT COMMENT '教室ID',
    max_students INT DEFAULT 0 COMMENT '最大选课人数',
    current_students INT DEFAULT 0 COMMENT '当前选课人数',
    week_day TINYINT COMMENT '星期几（1-7）',
    start_period TINYINT COMMENT '开始节次',
    end_period TINYINT COMMENT '结束节次',
    start_week INT COMMENT '开始周',
    end_week INT COMMENT '结束周',
    week_type ENUM('EVERY','ODD','EVEN') DEFAULT 'EVERY' COMMENT '周类型',
    is_required TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否必修课',
    target_grades VARCHAR(200) COMMENT '目标年级',
    target_majors VARCHAR(500) COMMENT '目标专业',
    `status` ENUM('NORMAL','SUSPENDED','RESCHEDULED') DEFAULT 'NORMAL' COMMENT '状态',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='课程开设表';

CREATE INDEX idx_course_id ON edu_course_offering(course_id);
CREATE INDEX idx_teacher_id ON edu_course_offering(teacher_id);
CREATE INDEX idx_semester_id ON edu_course_offering(semester_id);
CREATE INDEX idx_class_id ON edu_course_offering(class_id);
CREATE INDEX idx_classroom_id ON edu_course_offering(classroom_id);
CREATE INDEX idx_week_day ON edu_course_offering(week_day);
CREATE INDEX idx_status ON edu_course_offering(status);
CREATE INDEX idx_is_delete ON edu_course_offering(is_delete);
CREATE INDEX idx_schedule ON edu_course_offering(semester_id, week_day, start_period);

-- 2. exam_invigilator_assignment（监考安排表）
CREATE TABLE exam_invigilator_assignment (
    assignment_id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '监考安排ID',
    exam_id BIGINT NOT NULL COMMENT '考试ID',
    classroom_id BIGINT NOT NULL COMMENT '教室ID',
    teacher_id BIGINT NOT NULL COMMENT '教师ID',
    `role` ENUM('主监','副监') NOT NULL COMMENT '监考角色',
    created_at DATETIME NOT NULL COMMENT '创建时间',
    updated_at DATETIME NOT NULL COMMENT '更新时间',
    UNIQUE KEY uk_exam_classroom_teacher (exam_id, classroom_id, teacher_id)
) COMMENT='监考安排表';

CREATE INDEX idx_exam_id ON exam_invigilator_assignment(exam_id);
CREATE INDEX idx_classroom_id ON exam_invigilator_assignment(classroom_id);
CREATE INDEX idx_teacher_id ON exam_invigilator_assignment(teacher_id);
CREATE INDEX idx_role ON exam_invigilator_assignment(role);
CREATE INDEX idx_exam_classroom ON exam_invigilator_assignment(exam_id, classroom_id);
CREATE INDEX idx_teacher_exam ON exam_invigilator_assignment(teacher_id, exam_id);
CREATE INDEX idx_classroom_exam ON exam_invigilator_assignment(classroom_id, exam_id);

-- 四、问卷评教管理模块
-- 1. survey_template（学生问卷模板表）
CREATE TABLE survey_template (
    template_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '模板ID',
    template_name VARCHAR(200) NOT NULL COMMENT '模板名称',
    template_code ENUM('SATISFACTION','EVALUATION') NOT NULL UNIQUE COMMENT '模板编码',
    template_type ENUM('AFTER_CLASS','END_SEMESTER','TEACHING_QUALITY') NOT NULL COMMENT '模板类型',
    `description` TEXT COMMENT '模板描述',
    trigger_type ENUM('SCAN','TIMED','MANUAL') COMMENT '触发方式',
    valid_duration INT DEFAULT 24 COMMENT '有效时长（小时）',
    question_count INT DEFAULT 0 COMMENT '问题数量',
    is_anonymous TINYINT(1) DEFAULT 1 COMMENT '是否匿名',
    is_required TINYINT(1) DEFAULT 0 COMMENT '是否必填',
    score_calculation JSON COMMENT '分数计算规则',
    weight_config JSON COMMENT '权重配置',
    `status` ENUM('DRAFT','ENABLED','DISABLED') DEFAULT 'DRAFT' COMMENT '状态',
    `version` INT DEFAULT 1 COMMENT '版本号',
    create_by INT COMMENT '创建人',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）',
    delete_time DATETIME COMMENT '删除时间'
) COMMENT='学生问卷模板表';

CREATE INDEX idx_template_type ON survey_template(template_type);
CREATE INDEX idx_trigger_type ON survey_template(trigger_type);
CREATE INDEX idx_status ON survey_template(status);
CREATE INDEX idx_is_delete ON survey_template(is_delete);

-- 2. survey_question（问卷题目表）
CREATE TABLE survey_question (
    question_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '题目ID',
    template_id INT NOT NULL COMMENT '模板ID',
    question_text TEXT NOT NULL COMMENT '题目内容',
    question_type ENUM('SINGLE','MULTIPLE','RATING','TEXT') NOT NULL DEFAULT 'SINGLE' COMMENT '题型',
    dimension ENUM('ATTITUDE','METHOD','EFFECT','INTERACTION','HOMEWORK') COMMENT '评价维度',
    is_required TINYINT(1) DEFAULT 1 COMMENT '是否必答',
    max_score DECIMAL(5,2) COMMENT '最高分值',
    `weight` DECIMAL(5,2) DEFAULT 1 COMMENT '权重',
    options JSON COMMENT '选项列表（JSON格式）',
    scoring_rule JSON COMMENT '计分规则',
    display_order INT DEFAULT 0 COMMENT '显示顺序',
    help_text VARCHAR(500) COMMENT '帮助文本',
    `status` ENUM('NORMAL','DISABLED') DEFAULT 'NORMAL' COMMENT '状态',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='问卷题目表';

CREATE INDEX idx_template_id ON survey_question(template_id);
CREATE INDEX idx_question_type ON survey_question(question_type);
CREATE INDEX idx_dimension ON survey_question(dimension);
CREATE INDEX idx_status ON survey_question(status);
CREATE INDEX idx_is_delete ON survey_question(is_delete);

-- 3. survey_instance（问卷实例表）
CREATE TABLE survey_instance (
    instance_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '实例ID',
    template_id INT NOT NULL COMMENT '模板ID',
    survey_name VARCHAR(200) NOT NULL COMMENT '问卷名称',
    survey_type ENUM('TEACHING','SATISFACTION','COURSE','CUSTOM') COMMENT '问卷类型',
    course_id INT COMMENT '课程ID',
    class_id INT COMMENT '班级ID',
    teacher_id INT COMMENT '教师ID',
    session_id INT COMMENT '课堂会话ID',
    semester_id INT COMMENT '学期ID',
    start_time DATETIME NOT NULL COMMENT '开始时间',
    end_time DATETIME NOT NULL COMMENT '结束时间',
    qr_code VARCHAR(500) COMMENT '二维码地址',
    access_code VARCHAR(20) COMMENT '访问码',
    target_count INT DEFAULT 0 COMMENT '目标人数',
    submitted_count INT DEFAULT 0 COMMENT '已提交人数',
    completion_rate DECIMAL(5,2) DEFAULT 0 COMMENT '完成率',
    avg_score DECIMAL(5,2) COMMENT '平均分',
    is_published TINYINT(1) DEFAULT 0 COMMENT '是否已发布',
    publish_time DATETIME COMMENT '发布时间',
    reminder_sent INT DEFAULT 0 COMMENT '提醒次数',
    `status` ENUM('DRAFT','ONGOING','ENDED','ARCHIVED') DEFAULT 'DRAFT' COMMENT '状态',
    create_by INT COMMENT '创建人',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='问卷实例表';

CREATE INDEX idx_template_id ON survey_instance(template_id);
CREATE INDEX idx_course_id ON survey_instance(course_id);
CREATE INDEX idx_class_id ON survey_instance(class_id);
CREATE INDEX idx_teacher_id ON survey_instance(teacher_id);
CREATE INDEX idx_session_id ON survey_instance(session_id);
CREATE INDEX idx_semester_id ON survey_instance(semester_id);
CREATE INDEX idx_start_time ON survey_instance(start_time);
CREATE INDEX idx_end_time ON survey_instance(end_time);
CREATE INDEX idx_status ON survey_instance(status);
CREATE INDEX idx_is_delete ON survey_instance(is_delete);

-- 4. survey_response（答卷表）
CREATE TABLE survey_response (
    response_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '答卷ID',
    instance_id INT NOT NULL COMMENT '问卷实例ID',
    student_id INT COMMENT '学生ID（匿名时可为空）',
    anonymous_id VARCHAR(50) COMMENT '匿名标识',
    submit_time DATETIME NOT NULL COMMENT '提交时间',
    start_time DATETIME COMMENT '开始答题时间',
    duration INT COMMENT '答题时长（秒）',
    total_score DECIMAL(5,2) COMMENT '总分',
    satisfaction_score DECIMAL(5,2) COMMENT '满意度得分',
    evaluation_score DECIMAL(5,2) COMMENT '评教得分',
    dimension_scores JSON COMMENT '各维度得分（JSON）',
    ip_address VARCHAR(50) COMMENT '提交IP',
    is_valid TINYINT(1) DEFAULT 1 COMMENT '是否有效',
    invalid_reason VARCHAR(200) COMMENT '无效原因',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='答卷表';

CREATE INDEX idx_instance_id ON survey_response(instance_id);
CREATE INDEX idx_student_id ON survey_response(student_id);
CREATE INDEX idx_submit_time ON survey_response(submit_time);
CREATE INDEX idx_is_valid ON survey_response(is_valid);
CREATE INDEX idx_is_delete ON survey_response(is_delete);

-- 5. survey_statistics（问卷统计表）
CREATE TABLE survey_statistics (
    stats_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '统计ID',
    instance_id INT NOT NULL COMMENT '问卷实例ID',
    question_id INT COMMENT '题目ID（为空表示整体统计）',
    stats_type ENUM('OVERALL','QUESTION','DIMENSION') COMMENT '统计类型',
    dimension ENUM('ATTITUDE','METHOD','EFFECT','INTERACTION','HOMEWORK') COMMENT '评价维度',
    response_count INT DEFAULT 0 COMMENT '答题人数',
    avg_score DECIMAL(5,2) COMMENT '平均分',
    max_score DECIMAL(5,2) COMMENT '最高分',
    min_score DECIMAL(5,2) COMMENT '最低分',
    std_deviation DECIMAL(5,2) COMMENT '标准差',
    score_distribution JSON COMMENT '分数分布',
    option_statistics JSON COMMENT '选项统计',
    percentile_25 DECIMAL(5,2) COMMENT '25分位数',
    percentile_50 DECIMAL(5,2) COMMENT '50分位数（中位数）',
    percentile_75 DECIMAL(5,2) COMMENT '75分位数',
    satisfaction_level ENUM('EXCELLENT','GOOD','NEUTRAL','POOR','VERY_POOR') COMMENT '满意度等级',
    text_keywords JSON COMMENT '文本题关键词统计',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='问卷统计表';

CREATE INDEX idx_instance_id ON survey_statistics(instance_id);
CREATE INDEX idx_question_id ON survey_statistics(question_id);
CREATE INDEX idx_stats_type ON survey_statistics(stats_type);
CREATE INDEX idx_dimension ON survey_statistics(dimension);
CREATE INDEX idx_is_delete ON survey_statistics(is_delete);

-- 6. survey_evaluation_summary（评教汇总表）
CREATE TABLE survey_evaluation_summary (
    summary_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '汇总ID',
    teacher_id INT NOT NULL COMMENT '教师ID',
    course_id INT NOT NULL COMMENT '课程ID',
    semester_id INT NOT NULL COMMENT '学期ID',
    class_ids VARCHAR(500) COMMENT '涉及班级ID列表',
    total_students INT DEFAULT 0 COMMENT '应评学生总数',
    evaluated_students INT DEFAULT 0 COMMENT '已评学生数',
    evaluation_rate DECIMAL(5,2) DEFAULT 0 COMMENT '评教参与率',
    overall_score DECIMAL(5,2) COMMENT '综合评分',
    teaching_attitude_score DECIMAL(5,2) COMMENT '教学态度得分',
    teaching_method_score DECIMAL(5,2) COMMENT '教学方法得分',
    teaching_effect_score DECIMAL(5,2) COMMENT '教学效果得分',
    interaction_score DECIMAL(5,2) COMMENT '师生互动得分',
    homework_score DECIMAL(5,2) COMMENT '作业批改得分',
    score_rank INT COMMENT '分数排名',
    dept_avg_score DECIMAL(5,2) COMMENT '院系平均分',
    school_avg_score DECIMAL(5,2) COMMENT '全校平均分',
    improvement_suggestions TEXT COMMENT '改进建议汇总',
    positive_feedback TEXT COMMENT '正面反馈汇总',
    negative_feedback TEXT COMMENT '负面反馈汇总',
    evaluation_level ENUM('EXCELLENT','GOOD','QUALIFIED','IMPROVE') DEFAULT 'GOOD' COMMENT '评价等级',
    is_published TINYINT(1) DEFAULT 0 COMMENT '是否已发布给教师',
    publish_time DATETIME COMMENT '发布时间',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='评教汇总表';

CREATE INDEX idx_teacher_id ON survey_evaluation_summary(teacher_id);
CREATE INDEX idx_course_id ON survey_evaluation_summary(course_id);
CREATE INDEX idx_semester_id ON survey_evaluation_summary(semester_id);
CREATE INDEX idx_evaluation_level ON survey_evaluation_summary(evaluation_level);
CREATE INDEX idx_is_published ON survey_evaluation_summary(is_published);
CREATE INDEX idx_is_delete ON survey_evaluation_summary(is_delete);
CREATE INDEX idx_teacher_course_semester ON survey_evaluation_summary(teacher_id, course_id, semester_id);

-- 7. survey_reminder（问卷提醒记录表）
CREATE TABLE survey_reminder (
    reminder_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '提醒ID',
    instance_id INT NOT NULL COMMENT '问卷实例ID',
    student_id INT COMMENT '学生ID',
    reminder_type ENUM('SYSTEM','SMS','EMAIL') DEFAULT 'SYSTEM' COMMENT '提醒类型',
    reminder_time DATETIME NOT NULL COMMENT '提醒时间',
    reminder_content TEXT COMMENT '提醒内容',
    send_status ENUM('PENDING','SENT','FAILED') DEFAULT 'PENDING' COMMENT '发送状态',
    response_status ENUM('NO_RESPONSE','COMPLETED') DEFAULT 'NO_RESPONSE' COMMENT '响应状态',
    error_message VARCHAR(500) COMMENT '错误信息',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    delete_time DATETIME COMMENT '删除时间',
    is_delete TINYINT(1) DEFAULT 0 COMMENT '是否删除（0-未删除,1-已删除）'
) COMMENT='问卷提醒记录表';

CREATE INDEX idx_instance_id ON survey_reminder(instance_id);
CREATE INDEX idx_student_id ON survey_reminder(student_id);
CREATE INDEX idx_reminder_type ON survey_reminder(reminder_type);
CREATE INDEX idx_send_status ON survey_reminder(send_status);
CREATE INDEX idx_response_status ON survey_reminder(response_status);
CREATE INDEX idx_is_delete ON survey_reminder(is_delete);