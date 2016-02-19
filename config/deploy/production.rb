
user = 'deploy'
ip_address = '54.218.58.187' # ec2 new-contact-book
# ip_address = '45.32.15.126' # vps


role :app, ["#{user}@#{ip_address}"]
role :web, ["#{user}@#{ip_address}"]
role :db,  ["#{user}@#{ip_address}"]

server ip_address,
  user: user,
  roles: %w{web app}

set :rails_env, 'production'

set :bundle_flags, "--no-deployment"

# set :ssh_options, {
#  keys: %w(~/.ssh/vps-contactbook),
#  forward_agent: true,
#  port: 2222
# }
set :ssh_options, {
 keys: %w(~/.ssh/new-contact-book.pem),
 forward_agent: true,
 port: 22
}

 set :nginx_server_name, 'new-contactbook.appconus.com'
