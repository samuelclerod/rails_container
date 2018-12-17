#!/usr/local/bin/ruby
puts ARGV[0]
case ARGV[0]
when 'server'
    system("bundle exec rails s -p 3000 -b '0.0.0.0'")
when 'new'
    if system('bundle exec rails new . --force --database=postgresql')
        system('mv ./config/database.yml ./config/database_old.yml')
        system('cp ./container_files/database.yml ./config/database.yml')
        system('bundle exec rails db:create')
    end
end