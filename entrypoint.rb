#!/usr/local/bin/ruby

def create
    system 'bundle exec rails new . --force --database=postgresql'
    system 'mv ./config/database.yml ./config/database_old.yml' 
    system 'cp ./container_files/database.yml ./config/' 
    system 'bundle exec rails db:create' 
end

def server
    port=3000
    unless File.exists? 'db/seeds.rb'
        create
    end
    system 'rm -rf ./tmp/pids/server.pid' 
    system "bundle exec rails s -p #{port} -b 0.0.0.0" 
end

case ARGV[0]
when 'ola'
    puts 'Olá Mundo!'
when 'server'
    server
when 'create'
    create
else
    exec(ARGV.join(" "))
end