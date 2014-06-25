# TODO: rake db:seed:regions
# default model regions

# TODO: rake db:seed:regions xxx_regions
# custom model to xxx_regions

namespace :db do

  namespace :seed do
    desc "seed regions data to db"
    task :regions => :environment do
      # TODO:
    end
  end

end
