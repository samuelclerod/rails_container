#!/usr/local/bin/ruby
case ARGV[0]
when 'ola'
    puts 'Olá Mundo!'
when 'server'
    system('rm -rf ./tmp/pids/server.pid')
    system("bundle exec rails s -p 3000 -b '0.0.0.0'")
when 'new'
    if system('bundle exec rails new . --force --database=postgresql')
        system('mv ./config/database.yml ./config/database_old.yml')
        system('cp ./container_files/database.yml ./config/database.yml')
        system('bundle exec rails db:create')
    end
else
    exec(ARGV[0])
end