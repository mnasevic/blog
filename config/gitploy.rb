require 'gitploy/script'

configure do |c|
  c.path = '/home/deployer/www/milan.nasevic.com'

  stage :production do
    c.host = 'milan.nasevic.com'
    c.user = 'deployer'
  end
end

setup do
  remote do
    run "mkdir -p #{config.path}"
    run "cd #{config.path} && git init"
    run "git config --bool receive.denyNonFastForwards false"
    run "git config receive.denyCurrentBranch ignore"
  end
end

deploy do
  push!
  remote do
    run "cd #{config.path}"
    run "git reset --hard"
    run "ruby -v"
    run "bundle install"
    run "bundle exec rake db:migrate RAILS_ENV=production"
    run "bundle exec rake assets:precompile RAILS_ENV=production"
    run "touch tmp/restart.txt"
  end
end


