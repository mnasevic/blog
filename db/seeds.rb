user_raw_params = {
  email: "mnasevic@gmail.com",
  avatar: File.open('db/resources/avatar.jpg'),
  password: "password",
  password_confirmation: "password_confirmation",
  name: "Milan Nasevic",
  job_title: "Software developer",
  linkedin_url: "https://www.linkedin.com/in/milannasevic",
  about_info: "Working with Ruby, Ruby on Rails, HTML5, Git, Vim, CSS3, Sass, Compass, JQuery, JavaScript, Backbone.js, Coffeescript",
  github_url: "https://github.com/mnasevic",
  project_info: "Folow me on GitHub and view all my projects that I'm working on blah blah blah and blah blah."
}
user_params = ActionController::Parameters.new(user_raw_params)
user = User.create(user_params.permit!) # To whitelist an entire hash of parameter (permit!)

post_raw_params = {
  user_id: user.id,
  title: "Deploying with Gitploy",
  content: "<p>Often times I'm impressed by simple tools that do a great job. <a href=\"https://github.com/brentd/gitploy\" title=\"Dead-simple (no, really) deployment DSL created with git in mind.\">Gitploy</a>&#160;is one such tool, a very small deployment DSL&#160;created with git in mind that is dead-simple to use. It is only about 125 lines of <a href=\"https://github.com/brentd/gitploy/blob/master/lib/gitploy.rb\" title=\"Gitploy script code\">ruby code</a>&#160;that you can read and understand in few minutes.</p>
  <p>If you need a more complex deployment tool that supports different SCMs and has various predefined tasks for managing deploys go check out <a href=\"https://github.com/capistrano/capistrano\" title=\"Remote multi-server automation tool\">Capistrano</a>. Or if you need something in between you can check out&#160;<a href=\"https://github.com/mislav/git-deploy\" title=\"git deployment made easy\">git-deploy</a>&#160;which uses git hooks.</p>
  <p><strong>How do you deploy with Gitploy?</strong></p>
  <p>This is my Gitploy script for deploying <a href=\"http://popravi.mk/\" title=\"PopraviMK\">popravi.mk</a> to staging and production stages:</p>
  <pre class=\"brush: ruby\">
    require 'gitploy/script'

    configure do |c|
      stage :staging do
        c.path = '/home/deployer/www/staging.popravi.mk'
        c.host = 'staging.popravi.mk'
        c.user = 'deployer'
        c.local_branch = 'staging' # default is current branch
        c.remote_branch = 'master' # default is master
      end

      stage :production do
        c.path = '/home/deployer/www/popravi.mk'
        c.host = 'popravi.mk'
        c.user = 'deployer'
      end
    end

    setup do
      remote do
        run \"mkdir -p \#{config.path}\"
        run \"cd \#{config.path} && git init\"
        run \"git config --bool receive.denyNonFastForwards false\"
        run \"git config receive.denyCurrentBranch ignore\"
      end
    end

    deploy do
      push!
      remote do
        run \"cd \#{config.path}\"
        run \"git reset --hard\"
        run \"ruby -v\"
        run \"bundle install\"
        run \"bundle exec rake db:migrate RAILS_ENV=production\"
        run \"bundle exec rake assets:precompile\"
        run \"touch tmp/restart.txt\"
      end
    end
  </pre>
  <p>In the script, we define a <strong>path</strong>, <strong>user</strong> and <strong>host</strong>&#160;for the different stages that we want to deploy to:&#160;<strong>staging</strong>&#160;and <strong>production</strong>. We can specify <strong>local_branch</strong> and <strong>remote_branch</strong>&#160;for each stage. And&#160;we define <strong>setup</strong>&#160;step that will create&#160;target folder and initialize git repo and&#160;<strong>deploy</strong>&#160;step that will do the&#160;deploy. Both define which actions will be run on production and staging servers using&#160;&#160;SSH connection.</p>
  <p>To install the gem run:</p>
  <pre class=\"brush: ruby\">gem install gitploy</pre>
  <p>To setup the target folder&#160;and init repo&#160;for production stage run:</p>
  <pre class=\"brush: ruby\">gitploy production setup</pre>
  <p>To deploy the app to production run:</p>
  <pre class=\"brush: ruby\">gitploy production</pre>
  <p>For staging stage you'll need to do the same. And, there is also a manual step in between to configure the database.yml and other config files that are only setup once.</p>
  <p>How do you automate your deploys and what tools do you use?</p>",
  published_at: "2013-08-28 09:15:00",
  is_publish: true
}
post_params = ActionController::Parameters.new(post_raw_params)
post = Post.create(post_params.permit!) # To whitelist an entire hash of parameter (permit!)
