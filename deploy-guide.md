# jhbbearing.com 上线部署指南

## 已完成的工作

1. **项目构建完成**：已使用 `npx vite build` 成功构建，生成 `dist/` 目录。
2. **SEO 优化完成**：
   - `index.html` 已配置中文 keywords、description、canonical
   - `public/robots.txt` 已更新为 `https://www.jhbbearing.com/sitemap.xml`
   - `public/sitemap.xml` 已更新为 `https://www.jhbbearing.com/*`，包含 24 个页面 URL
   - `deploy/nginx.conf` 已更新为 `www.jhbbearing.com jhbbearing.com`
3. **部署包已生成**：`tasks/jhbbearing-deploy.tar.gz`（包含 dist、nginx.conf、README.md、deploy.sh）
4. **本地验证通过**：`http://localhost:8080` 首页、sitemap、robots.txt 均返回 200。

## 服务器部署步骤

### 方式一：使用自动部署脚本（推荐）

需要你的服务器已开启 SSH 访问，并且你持有 SSH 私钥。

```bash
# 1. 解压部署包到你本地
mkdir -p jhbbearing-website && cd jhbbearing-website
tar -xzf jhbbearing-deploy.tar.gz

# 2. 运行自动部署脚本
bash tasks/deploy.sh <服务器IP或域名> <SSH用户名> <部署路径> <域名>

# 示例：
bash tasks/deploy.sh 123.456.78.90 root /var/www/jhbbearing www.jhbbearing.com
```

脚本会自动完成：
- 上传 `dist/` 到服务器
- 安装/配置 Nginx
- 配置站点并启用
- 重载 Nginx

### 方式二：手动部署

1. 将 `dist/` 上传到服务器，例如 `/var/www/jhbbearing/`
2. 将 `deploy/nginx.conf` 复制到 `/etc/nginx/sites-available/jhbbearing`
3. 启用站点：
   ```bash
   sudo ln -s /etc/nginx/sites-available/jhbbearing /etc/nginx/sites-enabled/
   sudo nginx -t
   sudo systemctl reload nginx
   ```

## HTTPS / SSL 证书

强烈建议配置 HTTPS，使用 Let's Encrypt + Certbot：

```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d www.jhbbearing.com -d jhbbearing.com
```

## 域名解析

确保你的域名 `jhbbearing.com` 和 `www.jhbbearing.com` 的 A 记录已解析到服务器 IP。

## 搜索引擎提交

上线后提交站点地图，加速收录：

- 百度搜索资源平台：https://ziyuan.baidu.com — 提交 `https://www.jhbbearing.com/sitemap.xml`
- Google Search Console：https://search.google.com/search-console
- Bing Webmaster：https://www.bing.com/webmasters

## 验证上线

1. 访问 `https://www.jhbbearing.com`
2. 访问 `https://www.jhbbearing.com/sitemap.xml`
3. 访问 `https://www.jhbbearing.com/robots.txt`
4. 检查页面源代码中的 `<title>` 和 `<meta name="description">` 是否正确。
