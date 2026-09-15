# Guidbase DSL 技术文档

Guidbase DSL 是一种用于定义界面布局、组件结构和页面导航关系的结构化标记语言。本文档将逐一介绍其基本语法规则、核心组件以及具体的配置示例。

---

## button_navigator

`button_navigator` 是一个专门用于容纳导航按钮的容器组件。在界面呈现上，它通常将子组件以网格或平铺按钮的形式进行排列，方便用户进行快速的功能跳转。

### 属性 (Properties)

* **`title`** (String | 选填): 导航区域的标题，用于对当前组内的按钮进行分类标识。

### 子组件限制 (Children)

* 仅支持嵌套 `button` 组件。

### 代码示例

```text
nav/demo_button_navigator:page(title:"按钮导航")<
  demo_buttons:button_navigator(title: "按钮导航")<
    button1:button(title:"按钮A", action:"@nav/page1"),
    button2:button(title:"按钮B", action:"@nav/page2"),
    button3:button(title:"按钮C", action:"@nav/page3"),
    button4:button(title:"按钮D", action:"@nav/page4"),
    button5:button(title:"按钮E", action:"@nav/page5")
  >
>
```

## list_navigator

`list_navigator` 是一个列表式的导航容器组件。在界面呈现上，它通常将子组件渲染为垂直排列的行（Rows），适合展示条目较多或需要清晰列表结构的导航菜单。

### 属性 (Properties)

* **`title`** (String | 选填): 列表区域的头部标题，用于对列表内容进行分类说明。

### 子组件限制 (Children)

* 仅支持嵌套 `button` 组件（在此容器内，这些按钮通常会被渲染为可点击的列表行）。

### 代码示例

```text
nav/demo_list_navigator:page(title:"列表导航")<
  demo_buttons:list_navigator(title: "列表导航")<
    button1:button(title:"按钮A", action:"@nav/page1"),
    button2:button(title:"按钮B", action:"@nav/page2"),
    button3:button(title:"按钮C", action:"@nav/page3"),
    button4:button(title:"按钮D", action:"@nav/page4"),
    button5:button(title:"按钮E", action:"@nav/page5")
  >
>
```

## scroll_navigator

`scroll_navigator` 是一个支持滚动操作的导航容器组件。在界面呈现上，当子组件数量超出屏幕宽度或预设区域时，它允许用户通过左右（或上下）滑动来查看和点击更多的导航按钮。

### 属性 (Properties)

* **`title`** (String | 选填): 导航区域的标题，用于对滚动导航栏进行命名。

### 子组件限制 (Children)

* 仅支持嵌套 `button` 组件。

### 代码示例

```text
nav/demo_scroll_navigator:page(title:"滚动导航")<
  demo_buttons:scroll_navigator(title: "滚动导航")<
    button1:button(title:"按钮A", action:"@nav/page1"),
    button2:button(title:"按钮B", action:"@nav/page2"),
    button3:button(title:"按钮C", action:"@nav/page3"),
    button4:button(title:"按钮D", action:"@nav/page4"),
    button5:button(title:"按钮E", action:"@nav/page5")
  >
>
```

## slide_navigator

`slide_navigator` 是一个滑动式的导航容器组件。在界面呈现上，它通常以幻灯片（Slider）或轮播图/可滑动卡片的形式展示导航选项，用户可以通过左右轻扫（Swipe）手势在不同的导航按钮之间进行切换。

### 属性 (Properties)

* **`title`** (String | 选填): 滑动导航区域的标题，用于对当前模块进行命名。

### 子组件限制 (Children)

* 仅支持嵌套 `button` 组件。

### 代码示例

```text
nav/demo_slide_navigator:page(title:"滑动导航")<
  demo_buttons:slide_navigator(title: "滑动导航")<
    button1:button(title:"按钮A", action:"@nav/page1"),
    button2:button(title:"按钮B", action:"@nav/page2"),
    button3:button(title:"按钮C", action:"@nav/page3"),
    button4:button(title:"按钮D", action:"@nav/page4"),
    button5:button(title:"按钮E", action:"@nav/page5")
  >
>
```

## segments

`segments` 是一个分段选择组件（通常表现为分段控件或 Tab 切换栏）。它常用于在页面顶部或特定区域提供并排的多个分类选项，供用户点击切换，以实现数据过滤、分类浏览等功能。

### 属性 (Properties)

* **`title`** (String | 选填): 分段控件的标题，用于说明该分段组的用途。
* **`placement`** (String | 选填): 组件的布局位置。例如，值为 `"top"` 时表示将分段控件固定渲染在页面的顶部。

### 子组件限制 (Children)

* 仅支持嵌套 `text` 组件。
* 嵌套的每个 `text` 组件代表分段控件中的一个可选项，其 `title` 属性值即为该选项在界面上显示的文本。

### 代码示例

```text
segs/demo_segs_page:page(title:"分段查询")<
  demo_segs:segments(title: "分段查询", placement:"top")<
    seg1:text(title:"激情"),
    seg2:text(title:"刺激"),
    seg3:text(title:"牛逼"),
    seg4:text(title:"英勇")
  >
>
```

## tabs

`tabs` 是一个标签页（分页标签）容器组件。它用于将页面内容划分为多个不同的板块（Tab），使用户可以通过点击不同的标签头在多个视图（如表单、列表等）之间进行平滑切换，从而在有限的屏幕空间内展示更多分类信息。

### 属性 (Properties)

* **`title`** (String | 选填): 标签页组件的标题，通常显示在组件区域的上方。

### 子组件限制 (Children)

* 仅支持嵌套 `tab` 组件。每个 `tab` 组件代表一个独立的标签页面，其内部可以进一步承载各类表单、列表或展示型组件。

### 代码示例

```text
demo_tabs_page:page(title:"数据详情")<
  demo_tabs:tabs(title: "分页标签")<
    tab1:tab(title:"基本信息")<
      // 此处放置标签页 1 的具体内容
    >,
    tab2:tab(title:"扩展信息")<
      // 此处放置标签页 2 的具体内容
    >,
    tab3:tab(title:"其他信息")<
      // 此处放置标签页 3 的具体内容
    >
  >
>
```

## list_view

`list_view` 是一个用于展示多条结构化数据的容器组件。它支持通过配置列数（`cols`）实现单列垂直列表、多列网格或卡片式（瓦片）布局，并支持点击条目进行页面跳转及参数传递。

### 属性 (Properties)

* **`title`** (String | 选填): 列表的标题名称。
* **`data`** (String | 必填): 数据源的名称或路径，用于绑定列表需要展示的数据。
* **`next`** (String | 选填): 点击列表项时的跳转目标路由。通常在路径后使用 `?` 拼接参数字段（例如 `"list_form_page?person_id"`），以便在跳转时将对应行的数据 ID 传递给目标页面。

### 子组件限制 (Children)

支持嵌套各种用于数据绑定与呈现的字段组件，这些组件可以通过 `property` 属性与数据源中的字段进行映射：
* **`hidden`**: 隐藏字段（如主键 ID），不显示在界面上，但用于传参或标识。
* **`avatar`**: 头像/图片显示组件。
* **`text`**: 文本内容展示组件。
* **`date`**: 日期/时间展示组件。
* **`number`**: 数值展示组件。

### 代码示例

```text
list/list_view_page:page(title:"瓦片列表页面", main:"true")<
  demo_list:list_view(title:"瓦片列表", data:"demo", next:"@list/list_form_page?person_id")<
    person_id:hidden,
    avatar:avatar(title:"头像", group:"分组1", property:"avatar"),
    date1:date(title:"日期", required:"true", property:"secondary"),
    text1:text(title:"文本", required:"true", property:"primary"),
    num1:number(title:"数字", required:"true", property:"status")
  >
>
```

## grid_view

`grid_view` 是一个网格视图容器组件。它用于将绑定的数据源以网格或卡片矩阵的形式在页面上进行排列展示，适合用来构建图片墙、商品列表、卡片瓦片等高视觉密度的界面，并支持点击单项进行路由跳转和参数传递。

### 属性 (Properties)

* **`title`** (String | 选填): 网格区域的标题。
* **`data`** (String | 必填): 绑定的数据源名称或路径。
* **`next`** (String | 选填): 点击网格单项时的跳转目标路由。通常在路径后使用 `?` 拼接参数字段（例如 `"@grid/display_form_page?person_id"`），用于将选中项的标识传递给目标页面。

### 子组件限制 (Children)

支持嵌套各种用于网格单元内容展示和字段绑定的组件：
* **`hidden`**: 隐藏字段（如主键 ID），用于传递参数但不直接显示。
* **`image`**: 图片展示组件。
* **`date`**: 日期/时间展示组件。
* **`text`**: 文本内容展示组件。
* **`number`**: 数值展示组件。

### 代码示例

```text
grid/grid_view_page:page(title:"瓦片列表页面", main:"true")<
  demo_grid:grid_view(title:"瓦片列表", data:"demo", cols:"3", next:"@grid/display_form_page?person_id")<
    person_id:hidden,
    image:image(title:"头像", property:"image"),
    date1:date(title:"日期", property:"secondary"),
    text1:text(title:"文本", property:"primary"),
    num1:number(title:"数字", property:"status")
  >
>
```

## entry_form

`entry_form` 是一个用于数据录入和编辑的交互式表单组件。它支持配置多列网格布局（`cols`），并可容纳各种交互式输入字段（如文本、数值、日期、选择器、文件上传等）。该组件通常与提交和重置等表单动作（Actions）配合使用。

### 属性 (Properties)

* **`title`** (String | 选填): 表单的标题名称。
* **`data`** (String | 选填): 绑定的数据源或获取初始数据的接口路径，可携带参数（例如 `"demo?person_id"`）。
* **`cols`** (String/Integer | 选填): 表单字段的布局列数。例如，值为 `"3"` 时，表单默认以 3 列网格来排布子字段。

### 子字段通用控制属性

在 `entry_form` 内嵌套的各种输入组件，可以使用以下通用属性来控制其在表单中的布局、分组和校验行为：
* **`group`** (String | 选填): 将字段归类到指定的视觉分组（例如 `group:"分组1"`）。
* **`span`** (String/Integer | 选填): 跨列数。用于指定当前字段占据的网格列数（例如，在 `cols:"3"` 的表单中，`span:"3"` 表示该字段独占整行）。
* **`required`** (String/Boolean | 选填): 是否为必填项（例如 `required:"true"`），常用于提交前的表单校验。
* **`readonly`** (String/Boolean | 选填): 是否为只读状态（例如 `readonly:"true"`）。
* **`unit`** (String | 选填): 数值或文本字段的单位标识（例如 `unit:"米/秒"`）。

### 支持的内置动作 (Built-in Actions)

外部组件（如按钮）可以通过指定路径来触发 `entry_form` 的内置操作：
* **`@form_id.save`**: 校验并提交当前表单的数据。
* **`@form_id.reset`**: 重置当前表单的所有输入项为初始值。

### 代码示例

```text
form/entry_form_page:page(title:"输入表单页面")<
  demo_entry:entry_form(title:"输入表单", data:"demo?person_id", cols:"3")<
    person_id:hidden,
    avatar:avatar(title:"头像", group:"分组1", span:"3"),
    date1:date(title:"日期", required:"true", group:"分组1"),
    text1:text(title:"文本", required:"true", group:"分组1"),
    num1:number(title:"数字", required:"true", group:"分组1", unit:"米/秒"),
    sel10:select(title:"下拉框", required:"true", data:"enum[Y:YES('是'),N:NO('否'),U:UNKNOWN('未知')]", group:"分组1"),
    cas1:cascade(title:"级联选择", group:"分组1", span:"2"),
    mul1:multiselect(title:"多选框", group:"分组1", span:"2", data:"enum[Y:YES('大瓜'),N:NO('二瓜'),U:UNKNOWN('三瓜')]"),
    time1:time(title:"时间", group:"分组1"),
    tags1:tags(title:"标签", required:"true", group:"分组1", span:"3"),
    longtext1:longtext(title:"长文本", group:"分组1", span:"3"),
    images:images(title:"图片", group:"分组1", span:"3"),
    videos:videos(title:"视频", group:"分组1", span:"3"),
    files:files(title:"文件", group:"分组1", span:"3")
  >,
  buttons(placement:"bottom", title:"操作按钮")<
    demo_entry_save:button(action:"@demo_entry.save", title:"保存"),
    demo_entry_reset:button(action:"@demo_entry.reset", title:"重置")
  >
>
```

## display_form

`display_form` 是一个用于数据详情展示的只读表单组件。与 `entry_form`（录入表单）不同，`display_form` 的主要用途是纯文本或静态数据的排版展示，其内部的所有子字段默认处于只读或非编辑状态。

### 属性 (Properties)

* **`title`** (String | 选填): 表单的标题名称。
* **`data`** (String | 必填): 绑定的主数据模型名称（例如 `"demo"`）。
* **`cols`** (String/Integer | 选填): 网格布局列数。用于决定展示字段以几列进行并行排列（例如 `"3"`）。
* **`init`** (String | 选填): 初始化获取详情数据的请求接口路径，通常可以通过传参来定位特定记录（例如 `"demo?person_id"`）。

### 子字段通用属性

在 `display_form` 内嵌套的展示字段支持以下属性进行布局和数据格式化：
* **`group`** (String | 选填): 将字段归类展示在特定的分组面板内（例如 `group:"分组1"`）。
* **`span`** (String/Integer | 选填): 该展示项跨越的列数（例如，在 3 列布局下，`span:"3"` 表示该项占满一整行）。
* **`unit`** (String | 选填): 为展示的数值附加单位后缀（例如 `unit:"米/秒"`）。
* **`readonly`** (String/Boolean | 选填): 显式标注字段为只读状态（在 `display_form` 中通常默认皆为只读）。

### 代码示例

```text
form/display_form_page:page(title:"只读表单页面", params:"demo_id")<
  demo_entry:display_form(title:"只读表单", data:"demo", cols:"3", init:"demo?person_id")<
    person_id:hidden,
    date1:date(title:"日期", required:"true", group:"分组1"),
    text1:text(title:"文本", required:"true", group:"分组1"),
    num1:number(title:"数字", required:"true", group:"分组1", unit:"米/秒"),
    sel10:select(title:"下拉框", required:"true", data:"enum[Y:YES('是'),N:NO('否'),U:UNKNOWN('未知')]", group:"分组1"),
    cas1:cascade(title:"级联选择", group:"分组1", span:"2"),
    mul1:multiselect(title:"多选框", group:"分组1", span:"2"),
    time1:time(title:"时间", group:"分组1"),
    tags1:tags(title:"标签", required:"true", group:"分组1", span:"3"),
    longtext1:longtext(title:"长文本", group:"分组1", span:"3")
  >
>
```

## official_form

`official_form` 是一个专用于公文、行政审批或政务风格表单的容器组件。它适用于构建版式传统、严谨的网格化公文样式界面，并在底层结构上通过绑定特定的数据对象（`object`）来实现公文数据的展示或处理。

### 属性 (Properties)

* **`title`** (String | 选填): 公文表单的标题。
* **`object`** (String | 必填): 绑定的核心业务对象/实体名称（例如 `"demo_entry_object"`），用于关联后台公文流转或审批数据。
* **`cols`** (String/Integer | 选填): 网格布局列数（例如 `"3"`），用来规整地排布公文中的各个填写项。

### 子字段属性与支持

支持在其内部以统一的行政或审批表单样式呈现以下字段：
* **`group`** (String | 选填): 字段所属的分组或公文区块名称。
* **`span`** (String/Integer | 选填): 单个字段在网格布局中占据的列数（如 `span:"3"` 占据整行）。
* **`required`** (String/Boolean | 选填): 是否为公文必填项。
* **`readonly`** (String/Boolean | 选填): 该公文项是否只读。
* **`unit`** (String | 选填): 附加的数值单位后缀（例如 `unit:"米/秒"`）。

### 代码示例

```text
form/official_form_page:page(title:"公文表单页面")<
  demo_entry:official_form(title:"公文表单", object:"demo_entry_object", cols:"3")<
    date1:date(title:"日期", required:"true", group:"分组1"),
    text1:text(title:"文本", required:"true", group:"分组1"),
    num1:number(title:"数字", required:"true", group:"分组1", unit:"米/秒"),
    sel10:select(title:"下拉框", required:"true", data:"enum[Y:YES('是'),N:NO('否'),U:UNKNOWN('未知')]", group:"分组1"),
    cas1:cascade(title:"级联选择", group:"分组1", span:"2"),
    mul1:multiselect(title:"多选框", group:"分组1", span:"2"),
    time1:time(title:"时间", group:"分组1"),
    tags1:tags(title:"标签", required:"true", group:"分组1", span:"3"),
    longtext1:longtext(title:"长文本", group:"分组1", span:"3")
  >
>
```

## paged_table

`paged_table` 是一个分页数据表格组件。它用于以行和列的传统表格形式呈现多条结构化数据，内置分页处理逻辑，并通常与过滤查询表单（如 `criteria_form`）进行联动，同时支持在行末配置操作列以执行针对单行数据的编辑或删除等操作。

### 属性 (Properties)

* **`data`** (String | 必填): 绑定的分页数据源。可通过 `?{criteria_form_id}` 语法将特定的查询表单与表格进行关联绑定（例如 `"demo?{demo_criteria}"`），实现带条件的查询和自动分页。
* **`cols`** (String/Integer | 选填): 表格的布局列数参数，用于规定默认显示的核心字段列。

### 子组件与列配置 (Columns)

表格内部嵌套的字段组件在表格中将被渲染为数据列：
* 支持嵌套 `date`、`text`、`number`、`select`、`cascade`、`multiselect`、`time`、`tags` 等组件作为表格的列，其 `title` 即为表头。
* **`buttons`** (容器组件 | 选填): 用于在表格行末尾添加“操作”列。
  * 属性 `title` (String): 操作列的表头文字（例如 `title:"操作"`）。
  * 属性 `width` (String): 限制该操作列的显示宽度（例如 `width:"180"`）。
  * 内部嵌套的 `button` 组件用于触发针对当前行数据的特定动作（如 `@table_id.edit` 或 `@table_id.delete`）。

### 代码示例

```text
table/paged_table_page:page(title:"数据表格")<
  // 关联的查询表单
  demo_criteria:criteria_form(object:"demo")<
    date1:date(title:"日期"),
    text1:text(title:"文本", placeholder:"一个文本"),
    criteria_search:button(action:"@demo_table.search", title:"搜索")
  >,
  
  // 分页表格
  demo_table:paged_table(data:"demo?{demo_criteria}", cols:"3")<
    date1:date(title:"日期"),
    text1:text(title:"文本"),
    num1:number(title:"数字", unit:"米/秒"),
    
    // 行操作列
    buttons(title:"操作", width:"180")<
      demo_table_edit:button(action:"@demo_table.edit", title:"编辑"),
      demo_table_remove:button(action:"@demo_table.delete", title:"删除")
    >
  >
>
```

## paged_grid

`paged_grid` 是一个支持分页的数据网格组件。它用于将绑定的多条动态数据以多列卡片或网格的形式在界面上展示，并在底部内置分页机制。该组件通常与过滤查询表单（如 `criteria_form`）联动，并支持在卡片单元中配置操作按钮，实现交互操作（如弹窗编辑或抽屉展示）。

### 属性 (Properties)

* **`data`** (String | 必填): 绑定的数据源。支持通过 `?{criteria_form_id}` 语法将过滤查询表单与网格进行联动关联（例如 `"demo?{demo_criteria}"`）。
* **`cols`** (String/Integer | 选填): 网格在界面上呈现的列数（例如 `"3"`）。

### 子组件与数据绑定 (Children & Mappings)

* **字段绑定**: 内部可以嵌套各种基础字段组件（如 `date`、`text`、`number`、`multiselect`、`time`、`tags` 等），并使用 `property` 属性将字段映射到后台返回的数据属性（例如 `property:"start_time"`）。
* **`buttons`** (操作按钮组容器): 用于定义每个网格单元卡片中的操作按钮。
  * 属性 `title` (String): 操作区域的标识名称（通常显示为卡片底部的操作栏）。
  * 属性 `width` (String): 操作栏宽度限制。

### 交互动作前缀说明 (Action Prefixes)

在网格操作按钮的 `action` 属性中，支持通过特殊前缀来控制目标页面的打开交互方式：
* **`#` 前缀**: 以 **对话框/弹窗 (Dialog)** 的形式打开目标页面（例如 `action:"#form/demo_dialog_page"`）。
* **`%` 前缀**: 以 **滑动抽屉 (Drawer)** 的形式打开目标页面（例如 `action:"%form/demo_drawer_page"`）。
* **`@` 前缀**: 触发标准的系统动作或页面级方法（例如 `action:"@demo_table.remove"`）。

### 代码示例

```text
grid/paged_table_page:page(title:"数据网格")<
  // 查询过滤表单
  demo_criteria:criteria_form(data:"demo")<
    date1:date(title:"日期"),
    text1:text(title:"文本", placeholder:"一个文本"),
    criteria_search:button(action:"@demo_grid.search", title:"搜索")
  >,
  
  // 分页网格组件
  demo_grid:paged_grid(data:"demo?{demo_criteria}", cols:"3")<
    date1:date(title:"日期", property:"start_time"),
    text1:text(title:"文本", property:"primary"),
    num1:number(title:"数字", unit:"米/秒", property:"status"),
    tags1:tags(title:"标签", span:"3", property:"tags"),
    
    // 网格卡片的操作按钮
    buttons(title:"操作", width:"180")<
      demo_table_edit:button(action:"#form/demo_dialog_page", title:"编辑"),
      demo_table_view:button(action:"%form/demo_drawer_page", title:"查看"),
      demo_table_remove:button(action:"@demo_table.remove", title:"删除")
    >
  >
>
```
