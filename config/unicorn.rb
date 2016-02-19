root = '/var/www/contactbook/current'
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.err.log"
stdout_path "#{root}/log/unicorn.access.log"

listen '/tmp/unicorn.contactbook.sock'
worker_processes 2
timeout 30
