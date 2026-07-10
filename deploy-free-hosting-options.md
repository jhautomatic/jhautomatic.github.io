# 免费静态网站托管方案对比

## 推荐方案：Cloudflare Pages（首选）

**优点**：
- 完全免费，无限带宽
- 全球 CDN，访问速度快
- 支持自定义域名 + 自动 HTTPS
- 自动部署（GitHub 集成或 Wrangler CLI）

**适合**：企业官网、展示型网站

**部署文件**：
- `wrangler.toml`
- `tasks/deploy-cloudflare-pages.md`
- `.github/workflows/deploy-cloudflare.yml`

---

## 备选方案一：Vercel

**优点**：
- 免费个人/团队套餐
- 部署简单，国内访问速度较好
- 支持自定义域名 + HTTPS

**步骤**：
1. 访问 https://vercel.com 注册账号
2. 导入 GitHub 仓库
3. 构建设置：
   - Framework Preset: Vite
   - Build Command: `npx vite build`
   - Output Directory: `dist`
4. 添加自定义域名 `www.jhbbearing.com`

---

## 备选方案二：Netlify

**优点**：
- 免费套餐
- 支持拖拽部署
- 支持自定义域名

**步骤**：
1. 访问 https://netlify.com 注册账号
2. 拖拽 `dist/` 文件夹到 Netlify 控制台
3. 在 Site settings → Domain management 中添加自定义域名

---

## 备选方案三：GitHub Pages

**优点**：
- 完全免费
- 与 GitHub 仓库集成

**缺点**：
- 仓库需要公开
- 国内访问可能不稳定
- 不支持商业级自定义域名配置

**适合**：开源项目文档、个人博客

---

## 搜索引擎收录建议

无论选择哪种方案，上线后都需要主动向搜索引擎提交：

1. **百度搜索资源平台**：https://ziyuan.baidu.com
2. **Google Search Console**：https://search.google.com/search-console
3. **Bing Webmaster**：https://www.bing.com/webmasters

提交 `https://www.jhbbearing.com/sitemap.xml` 加速收录。

**注意**：如果托管在海外服务器（Cloudflare/Vercel/Netlify），百度爬虫抓取可能稍慢，但不影响正常收录。如果需要更快的国内收录速度，建议使用腾讯云 COS 或阿里云 OSS（需要域名备案）。
