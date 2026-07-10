# 使用 GitHub Pages 免费部署 jhbbearing.com

## 准备工作

1. **注册 GitHub 账号**（如未注册）
   - 访问 https://github.com/signup
   - 使用邮箱 `jhautomatic@outlook.com` 注册
   - 验证邮箱

2. **新建仓库**
   - 登录 GitHub → 点击右上角 `+` → New repository
   - 仓库名：`jhbbearing-website`
   - 选择 Public（GitHub Pages 免费版需要公开仓库）
   - 点击 Create repository

3. **绑定自定义域名**
   - 域名解析需要添加 CNAME 记录

## 部署方式

### 方式一：使用 GitHub Actions 自动部署（推荐）

1. 将项目代码推送到 GitHub：
   ```bash
   cd /workspace/app-cku4hf2twpvl
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/你的用户名/jhbbearing-website.git
   git push -u origin main
   ```

2. 启用 GitHub Pages
   - 进入仓库 → Settings → Pages
   - Source 选择 "GitHub Actions"
   - 等待 Actions 运行完成

3. 配置自定义域名
   - Settings → Pages → Custom domain
   - 输入 `www.jhbbearing.com`
   - 勾选 "Enforce HTTPS"

4. 在域名注册商添加 DNS 记录：
   | 类型 | 主机记录 | 记录值 |
   |------|---------|--------|
   | CNAME | www | 你的用户名.github.io |

### 方式二：手动上传 dist 文件夹

1. 本地构建项目：
   ```bash
   cd /workspace/app-cku4hf2twpvl
   npm install
   npx vite build
   ```

2. 新建一个独立仓库或使用 `gh-pages` 分支
3. 将 `dist/` 文件夹内容上传到仓库根目录
4. 在 Settings → Pages 中选择 Source 为 Deploy from a branch，选择分支

## 域名 DNS 配置

在域名注册商处添加：

| 类型 | 主机记录 | 记录值 |
|------|---------|--------|
| CNAME | www | 你的用户名.github.io |

例如：
```
www.jhbbearing.com CNAME jhautomatic.github.io
```

## 验证上线

1. 访问 `https://www.jhbbearing.com`
2. 访问 `https://www.jhbbearing.com/sitemap.xml`
3. 访问 `https://www.jhbbearing.com/robots.txt`

## 注意事项

- GitHub Pages 仓库必须公开才能免费使用
- 首次部署可能需要几分钟生效
- GitHub Pages 在国内访问可能不如 Cloudflare Pages 稳定
- 建议优先使用 Cloudflare Pages（参见 `deploy-cloudflare-pages.md`）
