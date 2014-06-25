require "rails"

module ChineseRegionsRails

  class Railtie < Rails::Railtie
    rake_tasks do
      # 加载 /lib/tasks/***.rake 文件
      Dir[File.join(File.dirname(__FILE__), '../tasks/*.rake')].each { |f| load f }
    end
  end

end
