# default model regions
# rake db:seed:regions

# TODO: rake db:seed:regions xxx_regions
# custom model to xxx_regions
require 'active_support/core_ext/string/inflections'
require "chinese_regions_rails"

namespace :db do

  namespace :seed do
    # TODO: reseed

    desc "seed regions data to db"
    task regions: :environment do
      args ||= {}
      args[:model_class] = 'region'
      region_class = args[:model_class].classify.constantize

      ChineseRegionsRails::JsonDataSource.query_regions do |region_param|
        region_class.create(region_param)
      end

      puts "insert regions"
      puts "total  : #{format("%4d", region_class.count)}"
      (1..3).each do |level|
        puts "level #{level}: #{format("%4d", region_class.where(level: level).count)}"
      end
    end
  end

end
