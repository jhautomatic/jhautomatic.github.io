#!/bin/bash
# GitHub 仓库自动更新脚本
# 使用方法：
# 1. 下载 jhbbearing-source.zip 并解压
# 2. 在解压后的文件夹内打开终端
# 3. 运行：bash update-github.sh

set -e

REPO_URL="https://github.com/jhautomatic/jhautomatic.github.io.git"

echo "=========================================="
echo "  丽水市家和自动化技术有限公司网站"
echo "  GitHub 仓库自动更新脚本"
echo "=========================================="
echo ""

# 检查是否安装了 git
if ! command -v git &> /dev/null; then
    echo "错误：没有检测到 Git，请先安装 Git：https://git-scm.com/downloads"
    exit 1
fi

# 检查是否已经在 git 仓库中
if [ -d ".git" ]; then
    echo "检测到本地 Git 仓库，开始拉取最新版本并推送更新..."
    git remote set-url origin "$REPO_URL"
    git add .
    git commit -m "更新轮播图图片 $(date '+%Y-%m-%d %H:%M:%S')" || echo "没有需要提交的更改"
    git push origin main
else
    echo "首次初始化 Git 仓库..."
    git init
    git branch -M main
    git remote add origin "$REPO_URL"
    git add .
    git commit -m "更新网站内容 $(date '+%Y-%m-%d %H:%M:%S')"
    echo "正在推送到 GitHub，请根据提示输入 GitHub 用户名和密码/Token..."
    git push -u origin main
fi

echo ""
echo "=========================================="
echo "  推送成功！"
echo "=========================================="
echo ""
echo "请等待 2-3 分钟，让 GitHub Actions 自动构建和部署。"
echo "部署完成后访问：https://jhautomatic.github.io"
echo ""
echo "你可以在 GitHub 仓库的 Actions 标签页查看部署进度："
echo "https://github.com/jhautomatic/jhautomatic.github.io/actions"
