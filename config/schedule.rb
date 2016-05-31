env :PATH, ENV['PATH']
set :output, {:error => "#{path}/log/cron_error_log.log", :standard => "#{path}/log/cron_log.log"}

every :day, at: "12:00am" do
  command "echo 'Begin cron tasks for #{Date.today.to_s}"
end

every 1.minute do
  command "echo 'Updating Job Listings'"
  runner "Job.update_listings"
  runner "Job.update_descriptions"
  command "echo 'Finished updating listings'"
end




# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
