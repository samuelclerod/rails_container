
case ARGV[0]
when 'server'
    system("bundle exec rails s -p 3000 -b '0.0.0.0'")
when 'new'
    if system('rails new . --force --database=postgresql')
        system('mv -rf config/database.yml config/database.yml')
        system('cp container_files/database.yml config/database.yml')
        system('rails db:create')
    end
end