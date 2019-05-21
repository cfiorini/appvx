namespace :popguide do

  desc 'Sync of all necessary API'
  task sync_all: :environment do
    Rake::Task['popguide:sync_country'].execute
    Rake::Task['popguide:sync_location'].execute
    Rake::Task['popguide:sync_popmap'].execute
  end

  desc 'Sync Country API from Popguide'
  task sync_country: :environment do
    Popguide::Country.remote_sync
  end

  desc 'Sync Location API from Popguide'
  task sync_location: :environment do
    Popguide::Location.remote_sync
  end

  desc 'Sync PopMap API from Popguide'
  task sync_popmap: :environment do
    Popguide::PopMap.remote_sync
  end

end