以下为您整理的 **微信小程序页面布局 FTL（FreeMarker）组件库技能文档**。文档已移除所有 XML/WXML 代码块，纯粹以技术规格、数据映射以及 CSS 类名设计的形式进行呈现。

---

# 微信小程序 WXML 模板生成组件库 (FTL) 开发手册

本手册记录了用于动态生成微信小程序前端视图（WXML）的 FreeMarker 宏（Macro）组件库的技术规格。组件库通过传入的元数据节点和缩进参数，定义了小程序的组件层级、样式类名（Class）以及事件绑定命名空间。

---

## 一、 导航类组件设计规格 (Navigators)

### 1. 轮播导航 (Scroll Navigator)
* **对应宏**：`print_scroll_navigator_layout`
* **交互设计**：使用滑块组件容器承载轮播图片，支持自动播放、无限循环以及自定义指示点指示器。
* **主要样式类名**：
  * 容器级：`scroll-navigator`
  * 图片项：`banner-image`
  * 指示器容器：`indicator-list`
  * 指示点：`indicator`，激活态追加 `indicator-active`
* **事件绑定**：
  * 容器变更绑定：`bindchange` 映射至 `handle[Id]Change`
  * 画面点击绑定：`bindtap` 映射至 `handle[ChildId]Tap`

### 2. 滑动卡片导航 (Slide Navigator)
* **对应宏**：`print_slide_navigator_layout`
* **交互设计**：横向滚动的卡片组。通过水平滚动的视图组件承载卡片轨道与卡片项。
* **主要样式类名**：
  * 滚动容器：`slide-navigator`
  * 内部轨道：`slide-track`
  * 卡片项：`slide-card`
  * 图标及文本：`card-icon`，`card-icon-text`
  * 内容区：`card-content`，`card-label`，`card-title`，`card-description`

### 3. 按钮式导航 (Button Navigator)
* **对应宏**：`print_button_navigator_layout`
* **交互设计**：网格状的主功能按钮，支持个性化图标与动态角标显示。
* **主要样式类名**：
  * 容器级：`button-navigator`
  * 按钮项：`brand-button`
  * 标志区：`brand-logo`
  * 名称：`brand-name`
  * 权益标签：`brand-benefit`

### 4. 列表项导航 (List Navigator)
* **对应宏**：`print_list_navigator_layout`
* **交互设计**：线性垂直单行导航，项之间输出分割线。
* **主要样式类名**：
  * 容器级：`list-navigator`
  * 列表行：`list-item`
  * 点击热区：`list-content`
  * 标题及尾部箭头：`list-title`，`list-arrow`
  * 分割线：`navigator-divider`

---

## 二、 输入与表单组件规格 (Form & Inputs)

### 1. 核心输入项分配器 (Input Layout)
* **对应宏**：`print_input_layout`
* **设计说明**：根据入参类型（Type）生成对应的基础交互组件：

| 输入类型 (Type) | 承载宿主组件 | 关联样式类名 | 交互与值绑定设计 |
| :--- | :--- | :--- | :--- |
| **avatar** | `<view>` + `<image>` | `avatar-upload`, `avatar`, `avatar-xl` | 点击触发上传，动态判断并展示默认占位图或真实头像。 |
| **date / time** | `<picker>` | `field-control`, `field-value`, `field-placeholder`, `field-arrow` | 日期或时间选择器，非空时改变文本样式并带下拉三角符号。 |
| **text / number** | `<input>` | `field-input`, `field-input-ro`, `field-with-suffix`, `field-suffix` | 支持数字类型转换，可追加单位后缀，支持只读态（ro）。 |
| **select** | `<picker>` | `field-control`, `field-value`, `field-placeholder`, `field-arrow` | 下拉单选，支持 Options 范围绑定及 Label 属性。 |
| **cascade** | `<picker>` | `field-control`, `field-value`, `field-placeholder`, `field-arrow` | 级联多列选择器，绑定列改变事件（onCascadeColumnChange）。 |
| **multiselect** | `<view>` | `option-chips`, `option-chip`, `option-chip-on`, `option-chip-check` | 选项芯片组，高亮时追加激活样式及勾选图标。 |
| **tags** | `<view>` | `tag`, `tag-teal`, `tag-gray`, `tag-add` | 标签组容器，点击已存标签触发移除，带添加按钮。 |
| **longtext** | `<textarea>` | `field-textarea` | 多行文本域，支持设置 maxlength 限制。 |
| **images** | `<view>` + `<image>` | `upload-row`, `upload-card`, `upload-card-img`, `upload-card-del`, `upload-card-add` | 图片上传九宫格，支持渲染、预览、删除与添加。 |
| **videos** | `<view>` | `upload-row`, `upload-card`, `upload-card-wide`, `upload-card-video` | 宽卡片视频上传项，带播放标识与删除。 |
| **files** | `<view>` | `file-list`, `file-row`, `file-row-icon`, `file-row-name`, `file-row-del` | 垂直列表展示的附件项，支持增删操作。 |

### 2. 输入表单容器 (Entry Form)
* **对应宏**：`print_entry_form_layout`
* **设计说明**：表单区块容器，利用卡片类名进行边界隔离。支持多列（cols）流式布局和分组规则（groups）。
* **主要样式类名**：`card`，`card-body`，`field`，`field-required`，`field-label`。

### 3. 条件筛选侧边栏 (Criteria Form)
* **对应宏**：`print_criteria_form_layout`
* **设计说明**：用于列表页面的抽屉式筛选项面板。
* **主要样式类名**：`filter-drawer`，`filter-drawer-open`（激活展开），`filter-row`，`filter-label`，`btn-actions`。

---

## 三、 数据展示组件规格 (Data Views)

### 1. 只读详情卡片 (Display Form)
* **对应宏**：`print_display_form_layout`
* **设计说明**：结构化数据查看面板，带有特定装饰小圆点和只读标签样式。
* **主要样式类名**：
  * 容器及头部：`card`，`card-header`，`section-dot`，`card-title`
  * 实体内容：`card-body`，`card-body-flush`，`disp-row`，`disp-row-left`，`disp-row-right`
  * 只读字段及单位：`disp-label`，`disp-value`，`disp-value-longtext`，`disp-unit`，`tag-blue`，`tag-teal`

### 2. 双栏分类视图 (Split List)
* **对应宏**：`print_split_list_layout`
* **设计说明**：左侧分类，右侧网格/列表的联动分类展示组件。
* **主要样式类名**：
  * 双栏容器：`split`
  * 左栏：`split-col-group`，空状态追加 `split-col-empty`
  * 分类项：`split-group-item`，高亮追加 `split-group-item-active`，文本 `split-group-name`
  * 右栏：`split-col-tile`，内含小标题 `split-tile-sec-title`、列表项 `list-item` 以及空组件。

### 3. 数据列表视图 (List View)
* **对应宏**：`print_list_view_layout`
* **设计说明**：垂直单列滚动列表，支持触底事件（onReachBottom）。
* **主要样式类名**：`list-item`，`load-more-status`（承载加载中/无更多数据等文本提示）。

### 4. 瀑布流/网格视图 (Grid View)
* **对应宏**：`print_grid_view_layout`
* **设计说明**：双列交错瀑布流（Waterfall Layout）结构，采用索引奇偶分配算法双向分流。
* **主要样式类名**：`waterfall-container`，`waterfall-column`，`waterfall-card`。

---

## 四、 操作与控制组件规格 (Controls)

### 1. 分段选择器/顶部栏 (Segments)
* **对应宏**：`print_segments_layout`
* **设计说明**：横向功能分段栏，支持顶部固定布局。
* **主要样式类名**：`top-fixed`，`filter-bar`，`segments`，`seg`（选中态 `seg-on`），`filter-btn`，`filter-btn-arrow`（抽屉展开状态 `filter-btn-arrow-up`）。

### 2. 标签页容器 (Tabs)
* **对应宏**：`print_tabs_layout`
* **设计说明**：带高亮下划线的 Tab 切换面板。
* **主要样式类名**：`tabs`，`tab-item`（激活态 `active`），`tab-text`，`tab-underline`。

---

## 五、 工具类与格式化函数命名规范

本组件库在动态拼装 WXML 时，底层调用了统一的 JavaScript 辅助函数进行转换：

1. **左边界补全（空格缩进）**：`${""?left_pad(indent)}` 接收一个数值并输出对应数量的空格，确保代码格式缩进正确。
2. **事件名转换**：`${js.nameType(widget.id)}`，该方法会将连字符或小驼峰的标识符，转为首字母大写的大驼峰形式。
   * 示例：标识符为 `save_btn`，输出为 `SaveBtn`。最终生成事件 `handleSaveBtnTap`。
3. **变量名转换**：`${js.nameVariable(widget.id)}`，该方法会将标识符转为符合 JavaScript 规范的小驼峰变量。
   * 示例：标识符为 `user_name`，输出为 `userName`。最终绑定至 `{{ userName }}`。
