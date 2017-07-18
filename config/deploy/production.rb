set :stage, :production
set :rails_env, :production
set :domain, "172.18.200.199"

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

append :linked_dirs, "log", "tmp"
