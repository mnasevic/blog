raw_parameters = { email: "mnasevic@gmail.com", name: "Milan Nasevic", is_admin: true, password: "password", password_confirmation: "password_confirmation" }
parameters = ActionController::Parameters.new(raw_parameters)
user = User.create(parameters.permit(:name, :email, :is_admin, :password, :password_confirmation))
