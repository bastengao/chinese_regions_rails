require "rails/generators"

module ChineseRegions
  class InstallGenerator < Rails::Generators::Base

    desc "Generate region model migration."
    def install
      rake 'railties:install:migrations'
    end

  end
end
