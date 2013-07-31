raw_parameters = {
  email: "mnasevic@gmail.com",
  password: "password",
  password_confirmation: "password_confirmation",
  name: "Milan Nasevic",
  job_title: "Software developer",
  linkedin_url: "http://linkedin.com",
  about_info: "Working with Ruby, Ruby on Rails, HTML5, Git, Vim, CSS3, Sass, Compass, JQuery, JavaScript, Backbone.js, Coffeescript",
  github_url: "http://github.com",
  project_info: "Folow me on GitHub and view all my projects that I'm working on blah blah blah and blah blah.",
}
parameters = ActionController::Parameters.new(raw_parameters)
user = User.create(parameters.permit!) # To whitelist an entire hash of parameter (permit!)
