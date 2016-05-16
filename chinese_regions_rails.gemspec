# coding: utf-8
lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require "chinese_regions_rails/version"


Gem::Specification.new do |spec|
  spec.name        = 'chinese_regions_rails'
  spec.version     = ChineseRegionsRails::VERSION
  spec.date        = '2014-06-24'
  spec.summary     = "中国省市区县数据库"
  spec.description = "中国省市区县数据库，包含 行政编码，邮政编码，地区拼音和简拼。 数据来源 https://github.com/xixilive/chinese_regions_db"
  spec.authors     = ["Basten Gao"]
  spec.email       = 'bastengao@gmail.com'
  spec.files      += Dir["Gemfile", "README.md", "Rakefile", "lib/**/*"]
  spec.homepage    = 'https://github.com/bastengao/chinese_regions_rails'
  spec.license     = 'MIT'
  spec.required_ruby_version     = '>= 1.9.3'
  spec.required_rubygems_version = '>= 1.8.11'

  spec.add_dependency 'rails', '>= 3.2'



  spec.test_files = Dir.glob("spec/**/*")
end
