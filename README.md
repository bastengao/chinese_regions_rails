# chinese_regions_rails

中国省市区县数据库，包含 行政编码，邮政编码，地区拼音和简拼。
数据来源 https://github.com/xixilive/chinese_regions_db 。
支持 active_record 和 mongoid 。

## 安装

Gemfile

```
gem 'chinese_regions_rails'
```

Copy migrations

```
rails g chinese_regions:install
```

db migration and seed

```
rake db:migrate
rake db:seed:regions
```

## 使用

直接使用 Region model

```ruby
class User < ActiveRecord::Base
  belongs_to :city, class_name: "ChineseRegions::Region"
end
```

#### 使用 [city-picker](https://github.com/tshi0912/city-picker) 作为表单输入

application.css 添加下面代码
```
*= require city-picker
```

application.js 中在 jQuery 后面引入文件
```
//= require city-picker.data
//= require city-picker
//= require chinese-regions
```

表单里可以使用 `city_picker_tag(method, value, options)` 和 `city_picker(method, options)`, 这两个标签只是简单的封装，options 可以传入任何东西。
```erb
# Region model
<%= city_picker_tag :city_id, @user.city %>
# Regoin id
<%= city_picker_tag :city_id, "610101", data: { level: :city } %>

<% form_for @user do |f| %>
  <%= f.city_pciker :city_id %>
<% end %>
```

## Region model

```ruby
class ChineseRegions::Region < ActiveRecord
  belogns_to :parent # 上级 region
  has_many :children # 下级 region
end
```

model 包含的属性
* id
* parent_id
* level
* name
* alias
* pinyin
* abbr
* zip

### Change log

* v1.0.0

    **Break Change**

    * 直接使用 engine 里的 ChineseRegions::Region model，而不是添加 model 到用户项目
    * 引入 city-picker

* v0.1.*

    修改 Sqlite3 数据源到 json

* v0.0.*

    生成 Region model 到用户项目
