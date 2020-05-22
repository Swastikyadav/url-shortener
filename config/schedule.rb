# Use this file to easily define all of your cron jobs.

every 1.minute do
  rake 'app:send_mail'
end