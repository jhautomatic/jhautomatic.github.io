#!/bin/bash
# Mac/Linux 完整项目一键上传到 GitHub
# 使用方法：把本脚本放在项目根目录（和 package.json 同目录），双击运行

echo "============================================"
echo "  丽水市家和自动化技术有限公司网站"
echo "  完整项目一键上传到 GitHub"
echo "============================================"
echo ""

# 检查是否安装了 git
if ! command -v git &> /dev/null; then
    echo "错误：没有检测到 Git。"
    echo "请先安装 Git：https://git-scm.com/downloads"
    exit 1
fi

# 切换到脚本所在目录
cd "$(dirname "$0")"

# 检查是否在项目根目录
if [ ! -f "package.json" ]; then
    echo "错误：当前文件夹不是项目根目录。"
    echo "请把本脚本放在和 package.json 同一个文件夹内再运行。"
    exit 1
fi

echo "正在上传完整项目..."

# 删除旧的 .git
if [ -d ".git" ]; then
    echo "清理旧的 Git 配置..."
    rm -rf .git
fi

# 初始化 Git
git init
git branch -M main
git remote add origin https://github.com/jhautomatic/jhautomatic.github.io.git

# 添加所有文件并提交
echo "正在添加文件..."
git add .
echo "正在提交..."
git commit -m "完整重建网站 $(date '+%Y-%m-%d %H:%M:%S')"

echo ""
echo "============================================"
echo "正在推送到 GitHub..."
echo "请根据提示输入你的 GitHub 用户名和密码/Token"
echo "用户名：jhautomatic"
echo "============================================"
echo ""

git push -f origin main

echo ""
echo "============================================"
echo "上传完成！"
echo "============================================"
echo ""
echo "请等待 3-5 分钟，让 GitHub Actions 自动构建和部署。"
echo "部署完成后访问：https://jhautomatic.github.io"
echo ""
echo "如果提示密码错误，请访问：https://github.com/settings/tokens"
echo "生成一个 Token，用 Token 代替密码输入。"
echo ""
read -p "按回车键退出..."
