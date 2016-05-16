require "helper"
require "chinese_regions_rails/json_data_source"

describe ChineseRegionsRails::JsonDataSource do
  it 'query_regions' do
    ChineseRegionsRails::JsonDataSource.query_regions do |region_param|
      expect(region_param).to be_truthy
    end
  end

  it 'regions' do
    regions = ChineseRegionsRails::JsonDataSource.regions
    expect(regions.size > 0).to be_truthy
    expect(regions.first.keys).to contain_exactly(*%w[code parent_code name alias pinyin abbr zip level])
  end
end
