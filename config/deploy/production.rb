
user = 'root'
ip_address = '45.32.15.126'


role :app, ["#{user}@#{ip_address}"]
role :web, ["#{user}@#{ip_address}"]
role :db,  ["#{user}@#{ip_address}"]

server ip_address,
  user: user,
  roles: %w{web app}

set :rails_env, 'production'

set :bundle_flags, "--no-deployment"

 set :ssh_options, {
   keys: %w(~/.ssh/contact-book.pub),
   forward_agent: true,
   port: 2222
 }

 set :nginx_server_name, 'contactbook.appconus.com'
