before_fork do
  # Default is every 6 hours
  PumaWorkerKiller.enable_rolling_restart

  ActiveRecord::Base.connection_pool.disconnect!
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
plugin :heroku
