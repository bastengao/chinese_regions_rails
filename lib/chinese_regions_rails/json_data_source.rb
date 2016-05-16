require 'json'

module ChineseRegionsRails
  class JsonDataSource
    class << self

      def query_regions
        regions.each do |region|
          yield(region) if block_given?
        end
      end

      def regions
        json_file = File.expand_path("../../regions.json", __FILE__)
        regions = File.open(json_file, 'r') do |f|
          JSON.parse(f.read)
        end
      end
    end
  end
end
