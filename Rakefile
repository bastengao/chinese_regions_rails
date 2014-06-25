require "bundler/gem_tasks"
require "rspec/core/rake_task"

Dir['lib/tasks/*.rake'].each { |rake| load rake }

RSpec::Core::RakeTask.new do |t|
  t.pattern = "spec/chinese_regions_rails/**/*_spec.rb"
end

task :default => :spec
task :test => :spec