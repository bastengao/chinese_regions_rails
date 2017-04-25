# rake db:seed:regions

require 'active_support/core_ext/string/inflections'
require "chinese_regions_rails"

namespace :db do

  namespace :seed do
    # TODO: reseed

    desc "seed regions data to db"
    task regions: :environment do
      region_class = ChineseRegions::Region

      ChineseRegionsRails::JsonDataSource.query_regions do |region_param|
        region_param["id"] = region_param.delete("code")
        region_param["parent_id"] = region_param.delete("parent_code")
        region_class.create!(region_param)
      end

      puts "insert regions"
      puts "total  : #{format("%4d", region_class.count)}"
      (1..3).each do |level|
        puts "level #{level}: #{format("%4d", region_class.where(level: level).count)}"
      end
    end
  end

end
