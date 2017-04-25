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
    
    直接使用 engine 里的 ChineseRegions::Region model，而不是添加 model 到用户项目

* v0.1.*

    修改 Sqlite3 数据源到 json

* v0.0.*

    生成 Region model 到用户项目
