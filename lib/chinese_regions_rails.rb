require "chinese_regions_rails/version"
require "chinese_regions_rails/json_data_source"
require "chinese_regions_rails/db" if defined? SQLite3

module ChineseRegionsRails
  require "chinese_regions_rails/railtie" if defined?(Rails)
end
