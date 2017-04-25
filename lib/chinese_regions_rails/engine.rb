require "rails"
require "chinese_regions_rails/helper"

module ChineseRegions

  class Engine < Rails::Engine
    isolate_namespace ChineseRegions

    initializer "chinese_regions_rails.helper_and_builder" do
      ActiveSupport.on_load :action_view do
        include ChineseRegionsRails::Helper
        ActionView::Helpers::FormBuilder.send(:include, ChineseRegionsRails::Builder)
      end
    end
  end

end
