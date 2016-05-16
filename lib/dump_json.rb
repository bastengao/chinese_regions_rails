require 'chinese_regions_rails'
require 'json'

regions = []
ChineseRegionsRails::DB.query_regions do |region_param|
  regions << region_param
end

File.open('regions.json', 'w+') do |f|
  f.write(JSON.pretty_generate(regions))
end
