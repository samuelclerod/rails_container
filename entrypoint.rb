
case ARGV[0]
when 'server'
    system("bundle exec rails s -p 3000 -b '0.0.0.0'")
when 'new'
    if system('rails new . --force --database=postgresql')
        system('rails db:create')
    end
end