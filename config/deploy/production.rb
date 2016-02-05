
user = 'ubuntu'
# ip_address = 'ec2-54-213-252-167.us-west-2.compute.amazonaws.com'
ip_address = '54.191.127.154'


role :app, ["#{user}@#{ip_address}"]
role :web, ["#{user}@#{ip_address}"]
role :db,  ["#{user}@#{ip_address}"]

server ip_address,
  user: user,
  roles: %w{web app}

set :rails_env, 'production'

set :bundle_flags, "--no-deployment"

 set :ssh_options, {
   keys: %w(~/.ssh/contact-book.pem),
   forward_agent: true,
 }

 set :nginx_server_name, 'contactbook.appconus.com'
