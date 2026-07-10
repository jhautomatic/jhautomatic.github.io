@echo off
chcp 65001 >nul
echo ============================================
echo    丽水市家和自动化技术有限公司网站
echo    完整项目一键上传到 GitHub
echo ============================================
echo.

REM 检查是否安装了 Git
git --version >nul 2>&1
if errorlevel 1 (
    echo 错误：没有检测到 Git。
    echo 请先下载安装 Git：https://git-scm.com/download/win
    echo 安装时一直点 "Next" 即可。
    pause
    exit /b 1
)

echo 已检测到 Git，开始上传完整项目...
echo.

REM 切换到脚本所在目录
cd /d "%~dp0"

REM 检查是否在项目根目录（通过 package.json 判断）
if not exist "package.json" (
    echo 错误：当前文件夹不是项目根目录。
    echo 请把本脚本放在和 package.json 同一个文件夹内再运行。
    pause
    exit /b 1
)

REM 删除旧的 .git 文件夹（如果有的话，避免冲突）
if exist ".git" (
    echo 清理旧的 Git 配置...
    rmdir /s /q ".git"
)

REM 初始化 Git 仓库
git init
git branch -M main
git remote add origin https://github.com/jhautomatic/jhautomatic.github.io.git

REM 添加所有文件并提交
echo 正在添加文件...
git add .
echo 正在提交...
git commit -m "完整重建网站 %date% %time%"

echo.
echo ============================================
echo 正在推送到 GitHub...
echo 请根据提示输入你的 GitHub 用户名和密码/Token
echo 用户名：jhautomatic
echo ============================================
echo.

git push -f origin main

echo.
echo ============================================
echo 上传完成！
echo ============================================
echo.
echo 请等待 3-5 分钟，让 GitHub Actions 自动构建和部署。
echo 部署完成后访问：https://jhautomatic.github.io
echo.
echo 如果提示密码错误，请访问：https://github.com/settings/tokens
echo 生成一个 Token，用 Token 代替密码输入。
echo.
pause
