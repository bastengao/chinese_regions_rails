require "helper"

require "chinese_regions_rails/db"

describe "db" do
  it "db" do
    db = ChineseRegionsRails::DB.db
    expect(db).to be_truthy
  end

  it "query regions" do
    ChineseRegionsRails::DB.query_regions do |region_param|
      expect(region_param).to be_truthy
    end
  end
end
