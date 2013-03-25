#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Ahowatcher::Application.load_tasks

desc "This task is called by the Heroku scheduler add-on"
  task :fetch_feed => :environment do
    Tasks::FetchFeedTask.test()
  end