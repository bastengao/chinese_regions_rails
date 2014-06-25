require "rails/generators"

module ChineseRegionsRails
  class InstallGenerator < Rails::Generators::NamedBase

    desc "Generate region model. Default model name is 'Region'"

    def install
      # TODO: set default model name "region"
      generate "model", "#{class_name} code:string parent_code:string name:string alias:string pinyin:string abbr:string zip:string"
    end

  end
end