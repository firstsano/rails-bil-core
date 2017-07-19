set :stage, :production
set :rails_env, :production
set :domain, "rcore.vgg.ru"

role :web, fetch(:domain)
role :app, fetch(:domain)
role :db,  fetch(:domain), :primary => true

set :branch, 'master'
set :deploy_to, "/opt/www/rcore"
set :tmp_dir, '/var/www/tmp'


set :bundle_flags, '--deployment'

set :ssh_options, {
  forward_agent: true,
  user: 'www-data',
}

set :passenger_restart_with_touch, true

append :linked_files, "config/application.yml"
append :linked_dirs, "log", "tmp"
