#!/bin/bash
# ============================================================
# MBA论文项目交互式初始化脚本
# ============================================================
# 功能：引导用户完成项目配置，生成配置文件和目录结构
# 使用：./init.sh
# ============================================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 项目根目录
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$PROJECT_DIR/config"

# 打印横幅
print_banner() {
    echo ""
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║                                                               ║${NC}"
    echo -e "${BLUE}║           ${GREEN}MBA毕业论文写作项目初始化向导${BLUE}                     ║${NC}"
    echo -e "${BLUE}║                                                               ║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# 打印分隔线
print_separator() {
    echo -e "${BLUE}───────────────────────────────────────────────────────────────${NC}"
}

# 打印步骤标题
print_step() {
    echo ""
    print_separator
    echo -e "${GREEN}$1${NC}"
    print_separator
    echo ""
}

# 读取用户输入
read_input() {
    local prompt="$1"
    local default="$2"
    local result

    if [ -n "$default" ]; then
        read -p "$(echo -e "${YELLOW}$prompt [${default}]: ${NC}")" result
        echo "${result:-$default}"
    else
        read -p "$(echo -e "${YELLOW}$prompt: ${NC}")" result
        echo "$result"
    fi
}

# 选择菜单
select_option() {
    local prompt="$1"
    shift
    local options=("$@")
    
    echo -e "${YELLOW}$prompt${NC}"
    for i in "${!options[@]}"; do
        echo "  $((i+1)). ${options[$i]}"
    done
    
    local choice
    while true; do
        read -p "$(echo -e "${YELLOW}请选择 (1-${#options[@]}): ${NC}")" choice
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#options[@]}" ]; then
            echo "${options[$((choice-1))]}"
            return
        fi
        echo -e "${RED}无效选择，请重新输入${NC}"
    done
}

# 多选菜单
multi_select() {
    local prompt="$1"
    shift
    local options=("$@")
    
    echo -e "${YELLOW}$prompt（多选，用空格分隔选项编号）${NC}"
    for i in "${!options[@]}"; do
        echo "  $((i+1)). ${options[$i]}"
    done
    
    local choices
    read -p "$(echo -e "${YELLOW}请选择: ${NC}")" choices
    
    local selected=()
    for choice in $choices; do
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#options[@]}" ]; then
            selected+=("${options[$((choice-1))]}")
        fi
    done
    
    echo "${selected[@]}"
}

# 确认信息
confirm() {
    local prompt="$1"
    local response
    
    read -p "$(echo -e "${YELLOW}$prompt (y/n): ${NC}")" response
    case "$response" in
        [yY][eE][sS]|[yY]) return 0 ;;
        *) return 1 ;;
    esac
}

# Step 1: 基本信息
step1_basic_info() {
    print_step "Step 1: 基本信息"
    
    PROJECT_NAME=$(read_input "请输入项目名称（用于创建目录）" "")
    TITLE=$(read_input "请输入论文题目" "")
    TITLE_EN=$(read_input "请输入英文题目" "")
    AUTHOR=$(read_input "请输入作者姓名" "")
    STUDENT_ID=$(read_input "请输入学号" "")
    SCHOOL=$(read_input "请输入学校名称" "")
    COLLEGE=$(read_input "请输入学院名称" "")
    SUPERVISOR=$(read_input "请输入导师姓名" "")
    SUPERVISOR_TITLE=$(read_input "请输入导师职称" "")
    RESEARCH_DIRECTION=$(read_input "请输入研究方向" "")
    COMPLETION_DATE=$(read_input "请输入完成时间（如：2026年05月）" "")
}

# Step 2: 研究设计
step2_research_design() {
    print_step "Step 2: 研究设计"
    
    # 研究类型
    RESEARCH_TYPE=$(select_option "请选择研究类型" \
        "案例研究" \
        "问卷调查" \
        "行动研究" \
        "混合研究")
    
    # 研究方法
    METHODS=$(multi_select "请选择研究方法" \
        "问卷调查" \
        "深度访谈" \
        "实地观察" \
        "文档分析" \
        "二手数据")
    
    # 理论框架
    FRAMEWORKS=$(multi_select "请选择理论框架（可自定义）" \
        "STP理论" \
        "4C营销理论" \
        "4P营销理论" \
        "波特五力模型" \
        "PEST分析" \
        "SWOT分析" \
        "平衡计分卡（BSC）" \
        "关键绩效指标（KPI）" \
        "其他（请说明）")
    
    # 研究问题
    PRIMARY_QUESTION=$(read_input "请输入主要研究问题" "")
    
    # 样本量
    SAMPLE_SIZE=$(read_input "请输入问卷样本量" "150")
    INTERVIEW_COUNT=$(read_input "请输入访谈人数" "8")
}

# Step 3: 学校规范
step3_school_format() {
    print_step "Step 3: 学校规范"
    
    # 字数要求
    WORD_COUNT=$(select_option "请选择论文字数要求" \
        "2万字以下" \
        "2-3万字" \
        "3-4万字" \
        "4万字以上")
    
    # 根据选择设置具体字数
    case "$WORD_COUNT" in
        "2万字以下") TOTAL_WORDS=15000 ;;
        "2-3万字") TOTAL_WORDS=25000 ;;
        "3-4万字") TOTAL_WORDS=30000 ;;
        "4万字以上") TOTAL_WORDS=40000 ;;
    esac
    
    # 查重系统
    PLAGIARISM_SYSTEM=$(select_option "请选择查重系统" \
        "知网" \
        "万方" \
        "维普" \
        "其他")
    
    # 查重率阈值
    PLAGIARISM_THRESHOLD=$(read_input "请输入查重率阈值（%）" "15")
    
    # 参考文献格式
    REFERENCE_STYLE=$(select_option "请选择参考文献格式" \
        "GB/T 7714-2015" \
        "APA" \
        "MLA" \
        "其他")
}

# Step 4: 生成配置
step4_generate_config() {
    print_step "Step 4: 生成配置"
    
    echo -e "${GREEN}配置信息确认：${NC}"
    echo ""
    echo "项目名称：$PROJECT_NAME"
    echo "论文题目：$TITLE"
    echo "作者姓名：$AUTHOR"
    echo "学号：$STUDENT_ID"
    echo "学校：$SCHOOL"
    echo "学院：$COLLEGE"
    echo "导师：$SUPERVISOR"
    echo "研究方向：$RESEARCH_DIRECTION"
    echo "研究类型：$RESEARCH_TYPE"
    echo "字数要求：$TOTAL_WORDS字"
    echo "查重系统：$PLAGIARISM_SYSTEM"
    echo "查重阈值：$PLAGIARISM_THRESHOLD%"
    echo ""
    
    if ! confirm "确认以上信息正确？"; then
        echo -e "${YELLOW}请重新运行脚本${NC}"
        exit 0
    fi
    
    # 创建新项目目录（在父目录）
    PARENT_DIR="$(dirname "$PROJECT_DIR")"
    NEW_PROJECT_DIR="$PARENT_DIR/$PROJECT_NAME"
    
    if [ -d "$NEW_PROJECT_DIR" ]; then
        echo -e "${YELLOW}警告：目录 $NEW_PROJECT_DIR 已存在${NC}"
        if ! confirm "是否覆盖？"; then
            echo -e "${YELLOW}已取消${NC}"
            exit 0
        fi
    fi
    
    # 复制模板到新目录
    echo -e "${BLUE}创建项目目录：$NEW_PROJECT_DIR${NC}"
    cp -r "$PROJECT_DIR" "$NEW_PROJECT_DIR"
    
    # 更新CONFIG_DIR指向新目录
    CONFIG_DIR="$NEW_PROJECT_DIR/config"
    
    # 生成配置文件
    generate_thesis_config
    generate_school_format
    generate_research_framework
    generate_defense_config
    
    # 更新新目录中的配置
    echo -e "${GREEN}配置生成完成！${NC}"
    echo ""
    echo -e "${GREEN}项目已创建：$NEW_PROJECT_DIR${NC}"
}

# 生成thesis-config.yaml
generate_thesis_config() {
    echo -e "${BLUE}生成 thesis-config.yaml...${NC}"
    
    cat > "$CONFIG_DIR/thesis-config.yaml" << EOF
# 论文核心配置文件
# 生成时间：$(date '+%Y-%m-%d %H:%M:%S')

# 论文元数据
metadata:
  title: "$TITLE"
  title_en: "$TITLE_EN"
  author: "$AUTHOR"
  student_id: "$STUDENT_ID"
  school: "$SCHOOL"
  college: "$COLLEGE"
  program: "MBA"
  supervisor: "$SUPERVISOR"
  supervisor_title: "$SUPERVISOR_TITLE"
  research_direction: "$RESEARCH_DIRECTION"
  completion_date: "$COMPLETION_DATE"

# 研究问题
research_questions:
  primary: "$PRIMARY_QUESTION"
  secondary:
    - ""

# 关键词
keywords:
  chinese:
    - ""
    - ""
    - ""
  english:
    - ""
    - ""
    - ""

# 研究方法
methodology:
  type: "$RESEARCH_TYPE"
  methods: [$(echo "$METHODS" | sed 's/ /", "/g' | sed 's/^/"/' | sed 's/$/"/')]
  sample_size: $SAMPLE_SIZE
  interview_count: $INTERVIEW_COUNT
  data_collection_period: ""

# 研究对象
research_subject:
  name: ""
  industry: ""
  scale: ""
  location: ""

# 论文结构
structure:
  chapter_count: 5
  chapters:
    - number: 1
      title: "绪论"
    - number: 2
      title: "相关理论与文献综述"
    - number: 3
      title: "现状分析"
    - number: 4
      title: "策略优化"
    - number: 5
      title: "结论与展望"

# 写作进度
progress:
  setup: "completed"
  literature: "not_started"
  framework: "not_started"
  data_collection: "not_started"
  writing: "not_started"
  review: "not_started"
  defense: "not_started"
EOF
}

# 生成school-format.yaml
generate_school_format() {
    echo -e "${BLUE}生成 school-format.yaml...${NC}"
    
    cat > "$CONFIG_DIR/school-format.yaml" << EOF
# 学校格式规范配置文件
# 生成时间：$(date '+%Y-%m-%d %H:%M:%S')

# 学校信息
school:
  name: "$SCHOOL"
  college: "$COLLEGE"

# 字体格式
format:
  font:
    title: "黑体"
    subtitle: "黑体"
    body: "宋体"
    english: "Times New Roman"
  size:
    title: 16
    subtitle: 14
    body: 12
  spacing:
    line: 1.5
  margin:
    top: 2.54
    bottom: 2.54
    left: 3.17
    right: 3.17

# 字数要求
word_count:
  total: $TOTAL_WORDS
  chapters:
    introduction: 3000
    literature: 6000
    analysis: 8000
    strategy: 8000
    conclusion: 2000

# 查重要求
plagiarism_check:
  threshold: $PLAGIARISM_THRESHOLD
  system: "$PLAGIARISM_SYSTEM"

# 参考文献格式
reference_format:
  style: "$REFERENCE_STYLE"
  count:
    total: 50
    chinese: 30
    english: 20
EOF
}

# 生成research-framework.yaml
generate_research_framework() {
    echo -e "${BLUE}生成 research-framework.yaml...${NC}"
    
    cat > "$CONFIG_DIR/research-framework.yaml" << EOF
# 研究框架配置文件
# 生成时间：$(date '+%Y-%m-%d %H:%M:%S')

# 理论框架
theoretical_framework:
  - name: ""
    description: ""
    application: ""
    key_references:
      - ""
    chapter_applied: []

# 分析工具
external_analysis:
  - name: "PEST"
    enabled: true
    focus_areas: []
  - name: "Porter_Five_Forces"
    enabled: true
    focus_areas: []

internal_analysis:
  - name: "SWOT"
    enabled: true
    focus_areas: []

market_analysis:
  - name: "STP"
    enabled: true
    dimensions: []

strategy_tools:
  - name: "4C"
    enabled: true
    dimensions: []

# 研究框架图
framework_diagram:
  type: "flowchart"
  layers: []
EOF
}

# 生成defense-config.yaml
generate_defense_config() {
    echo -e "${BLUE}生成 defense-config.yaml...${NC}"
    
    cat > "$CONFIG_DIR/defense-config.yaml" << EOF
# 答辩准备配置文件
# 生成时间：$(date '+%Y-%m-%d %H:%M:%S')

# 答辩PPT配置
ppt:
  total_slides: 20
  presentation_time: 15
  structure:
    - section: "封面"
      slides: 1
    - section: "目录"
      slides: 1
    - section: "研究背景与问题"
      slides: 3
    - section: "研究方法与数据"
      slides: 2
    - section: "核心发现"
      slides: 5
    - section: "策略方案"
      slides: 4
    - section: "研究结论"
      slides: 2
    - section: "局限性与展望"
      slides: 1
    - section: "致谢"
      slides: 1

# 答辩准备
defense_preparation:
  timeline_weeks: 6
  mock_sessions: 3
EOF
}

# 创建目录结构
create_directories() {
    echo -e "${BLUE}创建目录结构...${NC}"
    
    # 创建必要的目录
    mkdir -p "$PROJECT_DIR/sources/Classic"
    mkdir -p "$PROJECT_DIR/sources/KeyTexts"
    mkdir -p "$PROJECT_DIR/sources/Supporting"
    mkdir -p "$PROJECT_DIR/drafts"
    mkdir -p "$PROJECT_DIR/reviews"
    mkdir -p "$PROJECT_DIR/output"
    mkdir -p "$PROJECT_DIR/output/figures"
    mkdir -p "$PROJECT_DIR/data"
    
    # 创建章节草稿文件
    for i in 1 2 3 4 5; do
        case $i in
            1) title="绪论"; slug="introduction" ;;
            2) title="相关理论与文献综述"; slug="literature" ;;
            3) title="现状分析"; slug="analysis" ;;
            4) title="策略优化"; slug="strategy" ;;
            5) title="结论与展望"; slug="conclusion" ;;
        esac

        existing=("$PROJECT_DIR"/drafts/chapter${i}-*.md)
        if [ ! -e "${existing[0]}" ]; then
            cat > "$PROJECT_DIR/drafts/chapter${i}-${slug}.md" << EOF
# 第${i}章 ${title}

[请在此处编写第${i}章内容]
EOF
        fi
    done
    
    # 创建空的审稿报告文件
    touch "$PROJECT_DIR/reviews/peer-review-report.md"
    touch "$PROJECT_DIR/reviews/quality-editor-report.md"
    touch "$PROJECT_DIR/reviews/critical-thinking-report.md"
    
    echo -e "${GREEN}目录结构创建完成${NC}"
}

# 完成初始化
finish() {
    print_step "初始化完成！"
    
    echo -e "${GREEN}项目初始化成功！${NC}"
    echo ""
    echo "新项目目录：$NEW_PROJECT_DIR"
    echo ""
    echo "后续步骤："
    echo "  1. 进入项目目录：cd $PROJECT_NAME"
    echo "  2. 完善 config/ 目录下的配置文件"
    echo "  3. 阅读 workflows/00-setup.md 了解项目概况"
    echo "  4. 按照 workflows/ 下的工作流文档逐步推进"
    echo "  5. 参考 skills/ 下的指南使用Claude Code Skills"
    echo ""
    echo "常用命令："
    echo "  查看工作流：cat workflows/01-literature.md"
    echo "  查看Skills：cat skills/skills-quickref.md"
    echo ""
    echo -e "${BLUE}祝你论文写作顺利！${NC}"
}

# 主函数
main() {
    print_banner
    
    echo "本向导将引导你完成MBA论文项目的初始化配置。"
    echo "请按照提示输入相关信息。"
    echo ""
    
    if ! confirm "是否开始初始化？"; then
        echo "已取消初始化"
        exit 0
    fi
    
    step1_basic_info
    step2_research_design
    step3_school_format
    step4_generate_config
    finish
}

# 运行主函数
main
