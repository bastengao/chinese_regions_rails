# coding: utf-8
lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require "chinese_regions_rails/version"


Gem::Specification.new do |s|
  s.name        = 'chinese_regions_rails'
  s.version     = ChineseRegionsRails::VERSION
  s.date        = '2014-06-24'
  s.summary     = "中国省市区县数据库"
  s.description = "中国省市区县数据库，包含 行政编码，邮政编码，地区拼音和简拼。 数据来源 https://github.com/xixilive/chinese_regions_db"
  s.authors     = ["Basten Gao"]
  s.email       = 'bastengao@gmail.com'
  # s.files       = ["lib/chinese_regions.rb"]
  s.files      += Dir.glob("lib/**/*")
  s.homepage    = 'https://github.com/bastengao/chinese_regions_rails'
  s.license     = 'MIT'
  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.8.11'



  s.test_files = Dir.glob("spec/**/*")
end