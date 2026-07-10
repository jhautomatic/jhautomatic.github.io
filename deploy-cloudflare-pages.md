# 使用 Cloudflare Pages 免费部署 jhbbearing.com

## 方案优势

- **完全免费**：Cloudflare Pages 提供免费套餐，无限带宽
- **全球 CDN**：访问速度快，支持 HTTPS
- **自定义域名**：可绑定你自己的 `jhbbearing.com`
- **自动部署**：支持 GitHub 自动集成

## 部署步骤

### 方式一：通过 Wrangler CLI 部署（推荐，无需 GitHub）

1. **注册 Cloudflare 账号**
   - 访问 https://dash.cloudflare.com/sign-up
   - 使用邮箱注册并验证

2. **安装 Wrangler CLI**
   在你的电脑上打开终端：
   ```bash
   npm install -g wrangler
   ```

3. **登录 Cloudflare**
   ```bash
   wrangler login
   ```
   这会打开浏览器让你授权登录。

4. **构建项目**
   进入项目目录：
   ```bash
   cd /path/to/app-cku4hf2twpvl
   npm install
   npx vite build
   ```

5. **部署到 Cloudflare Pages**
   ```bash
   wrangler pages deploy dist --project-name jhbbearing-website
   ```

6. **绑定自定义域名**
   - 进入 Cloudflare Pages 控制台
   - 找到你的项目 `jhbbearing-website`
   - 点击「自定义域」→ 添加 `www.jhbbearing.com` 和 `jhbbearing.com`
   - 按提示在你的域名注册商处添加 CNAME 记录

### 方式二：通过 GitHub 自动部署

1. 将项目代码推送到 GitHub 仓库
2. 在 Cloudflare Pages 控制台选择「创建项目」→「连接到 Git」
3. 选择你的 GitHub 仓库
4. 构建设置：
   - 构建命令：`npx vite build`
   - 构建输出目录：`dist`
5. 保存并部署
6. 绑定自定义域名（同上）

## 域名 DNS 配置

在域名注册商（或 Cloudflare DNS）添加以下记录：

| 类型 | 主机记录 | 记录值 |
|------|---------|--------|
| CNAME | www | jhbbearing-website.pages.dev |
| A | @ | 你的 Cloudflare Pages IP（见控制台提示） |

## HTTPS / SSL

Cloudflare Pages 会自动为你的域名申请并配置 SSL 证书，无需手动操作。

## 搜索引擎提交

上线后提交站点地图，加速收录：

- 百度：https://ziyuan.baidu.com — 提交 `https://www.jhbbearing.com/sitemap.xml`
- Google：https://search.google.com/search-console
- Bing：https://www.bing.com/webmasters

## 验证上线

1. 访问 `https://www.jhbbearing.com`
2. 访问 `https://www.jhbbearing.com/sitemap.xml`
3. 访问 `https://www.jhbbearing.com/robots.txt`
