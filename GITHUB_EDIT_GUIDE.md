# 直接在 GitHub 上修改网站内容

## 能否直接修改？

**可以。** 你的仓库已经配置好了 GitHub Actions，只要你在 GitHub 上修改任何文件并提交（commit），Actions 会自动重新构建并部署网站。通常 2-3 分钟后就能看到更新。

**临时访问地址**：https://jhautomatic.github.io/  
**自定义域名**：https://www.jhbbearing.com（绑定后）

---

## 推荐修改的文件

### 1. 修改产品信息
文件：`src/data/products.ts`

里面包含：
- 产品分类名称
- 产品图片路径
- 产品参数和描述
- 产品详情

### 2. 修改公司新闻
文件：`src/data/news.ts`

里面包含：
- 新闻标题
- 新闻内容
- 发布日期

### 3. 修改页面文字（国际化）
文件：`src/data/i18n.ts`

里面包含：
- 导航栏文字
- 页面标题
- 按钮文字
- 各种提示信息

### 4. 修改首页内容
文件：`src/pages/HomePage.tsx`

里面包含：
- 首页轮播图
- 公司简介
- 产品展示
- 联系方式

### 5. 修改联系页面
文件：`src/pages/ContactPage.tsx`

里面包含：
- 公司名称
- 地址
- 电话
- 联系人
- 邮箱

---

## 在 GitHub 网页上修改的步骤

### 步骤 1：打开仓库
访问：https://github.com/jhautomatic/jhautomatic.github.io

### 步骤 2：找到要修改的文件
例如要修改产品信息：
1. 点击 `src`
2. 点击 `data`
3. 点击 `products.ts`

### 步骤 3：编辑文件
1. 点击右上角的 **铅笔图标**（Edit this file）
2. 修改你要改的内容
3. 向下滚动到页面底部
4. 填写提交信息：
   - 例如：`更新产品描述`
5. 选择 **Commit directly to the main branch**
6. 点击 **Commit changes**

### 步骤 4：等待自动部署
1. 点击仓库顶部的 **Actions** 标签
2. 看到最新的工作流正在运行（黄色圆圈）
3. 等待变成绿色对勾 ✅（约 2-3 分钟）
4. 刷新你的网站查看更新

---

## 修改图片

### 替换现有图片
1. 找到 `public/images/` 目录下的图片
2. 点击要替换的图片
3. 点击右上角的 **三个点** → **Delete this file** 删除旧图片
4. 然后点击 **Add file** → **Upload files**
5. 上传新图片，文件名必须和旧图片完全一致
6. 提交更改

### 添加新图片
1. 进入 `public/images/` 目录
2. 点击 **Add file** → **Upload files**
3. 拖拽或选择新图片
4. 提交更改
5. 在对应的 tsx 或 ts 文件中引用新图片路径

---

## 修改时的注意事项

### 1. 不要修改 .github/workflows/ 文件夹
除非你知道自己在做什么，否则不要修改这个文件夹里的内容。

### 2. 不要删除关键文件
以下文件不要随意删除：
- `index.html`
- `package.json`
- `vite.config.ts`
- `src/main.tsx`
- `src/App.tsx`
- `.github/workflows/deploy-github-pages.yml`

### 3. 修改前备份
建议重要修改前先复制一份原文件内容，万一改错了可以恢复。

### 4. 提交信息要写清楚
- ❌ "更新"
- ✅ "更新直线导轨产品参数"
- ✅ "修改公司联系电话"

---

## 进阶：在本地修改（推荐长期维护）

如果以后经常需要修改，建议用 VS Code 在本地编辑：

1. 安装 VS Code：https://code.visualstudio.com/
2. 安装 Git：https://git-scm.com/
3. 克隆仓库到本地：
   ```bash
   git clone https://github.com/jhautomatic/jhautomatic.github.io.git
   cd jhautomatic.github.io
   ```
4. 用 VS Code 打开文件夹并修改
5. 保存后提交：
   ```bash
   git add .
   git commit -m "修改内容说明"
   git push
   ```
6. GitHub Actions 会自动部署

---

## 常见问题

### 修改后网站没有更新？
1. 检查 Actions 是否成功（绿色对勾 ✅）
2. 清除浏览器缓存（Ctrl+F5 或 Cmd+Shift+R）
3. 等待 5 分钟再刷新

### 网站变成空白？
可能是修改时删掉了重要符号（如括号、引号、逗号）。
解决：
1. 点击该文件
2. 点击右上角的 **时钟图标**（History）
3. 找到上一次正常的版本
4. 点击 **Revert** 恢复

### 可以修改网站颜色、字体吗？
可以，但需要修改 `src/index.css` 或 `tailwind.config.js`。
这类修改建议有一定 CSS 基础的人操作。
