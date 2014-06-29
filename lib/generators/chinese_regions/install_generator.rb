require "rails/generators"

module ChineseRegions
  class InstallGenerator < Rails::Generators::Base

    desc "Generate region model. Default model name is 'Region'"

    def install
      class_name = "region"
      generate "model", "#{class_name} code:string parent_code:string name:string alias:string pinyin:string abbr:string zip:string level:integer"
    end

  end
end