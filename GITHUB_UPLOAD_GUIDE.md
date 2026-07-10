# GitHub 仓库上传和 GitHub Pages 部署指南

## 打包文件

源代码已打包为：`/workspace/app-cku4hf2twpvl/tasks/jhbbearing-source.zip`（26MB）

文件包含：
- `src/` — 所有页面组件和代码（React + TypeScript）
- `public/` — 静态资源（图片、favicon、robots.txt、sitemap.xml）
- `deploy/` — Nginx 部署配置
- `.github/workflows/` — GitHub Actions 自动部署工作流
- `package.json` — 项目依赖
- `vite.config.ts` — 构建配置
- `index.html` — 入口 HTML
- `tailwind.config.js`、`tsconfig.json` 等配置文件

## 上传到 GitHub 的步骤

### 方式一：通过 GitHub 网页上传（最简单，不需要命令行）

1. **下载文件**
   - 将 `jhbbearing-source.zip` 下载到本地电脑
   - 解压到文件夹，例如 `jhbbearing-website/`

2. **创建 GitHub 仓库**
   - 登录 https://github.com
   - 点击右上角 `+` → New repository
   - 仓库名：`jhbbearing-website`
   - 选择 **Public**（GitHub Pages 免费版需要公开仓库）
   - 不要勾选 "Add a README"（因为我们已有 README）
   - 点击 **Create repository**

3. **上传文件**
   - 在仓库页面，点击 "uploading an existing file"
   - 把 `jhbbearing-website/` 文件夹内的所有内容拖拽到上传区域
   - 或者点击 "choose your files" 选择所有文件
   - 填写提交信息：`Initial commit`
   - 点击 **Commit changes**

### 方式二：通过 Git 命令行推送

```bash
# 1. 下载并解压 jhbbearing-source.zip
# 2. 进入解压后的文件夹
cd jhbbearing-website

# 3. 初始化 Git
git init

# 4. 添加远程仓库（替换为你的用户名）
git remote add origin https://github.com/你的用户名/jhbbearing-website.git

# 5. 提交并推送
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
```

## 启用 GitHub Pages 自动部署

上传完成后，仓库会自动触发 GitHub Actions 部署：

1. 进入仓库 → **Actions** 标签页
2. 你应该看到 `Deploy to GitHub Pages` 工作流正在运行
3. 等待绿色对勾（约 2-3 分钟）

如果工作流没有自动运行，请手动启用：
1. 仓库 → **Settings** → **Pages**
2. Source 选择 **GitHub Actions**
3. 返回 Actions 页面，点击 **Run workflow** 手动触发

## 绑定自定义域名

1. 仓库 → **Settings** → **Pages**
2. 在 Custom domain 输入：`www.jhbbearing.com`
3. 勾选 **Enforce HTTPS**
4. 在域名注册商添加 DNS 记录：
   | 类型 | 主机记录 | 记录值 |
   |------|---------|--------|
   | CNAME | www | 你的用户名.github.io |

## 验证上线

- 临时地址：`https://你的用户名.github.io/jhbbearing-website`
- 自定义域名：`https://www.jhbbearing.com`

## 后续更新

修改代码后重新上传并推送：
```bash
git add .
git commit -m "更新内容"
git push
```
GitHub Actions 会自动重新构建并部署。