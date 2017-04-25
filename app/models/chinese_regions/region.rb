module ChineseRegions
  class Region < ActiveRecord::Base
    self.table_name = "chinese_regions"

    # Rails 5 默认 belongs_to 有 presence 验证
    belongs_to :parent, class_name: "Region", optional: true if Rails::VERSION::MAJOR >= 5
    belongs_to :parent, class_name: "Region" if Rails::VERSION::MAJOR < 5
    has_many :children, class_name: "Region", foreign_key: "parent_id"

    def full_name(delimiter = "")
      if parent.present?
        "#{self.parent.full_name(delimiter)}#{delimiter}#{self.name}"
      else
        self.name
      end
    end
  end
end
