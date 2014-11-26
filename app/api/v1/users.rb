module V1
  class Users < Grape::API

=begin
#-------------------------------------------------------------------
# List all users
#-------------------------------------------------------------------
# get /user/
desc "Get all user", {
nickname: "getAllUser",
http_codes: {
400 => "Invalid username supplied",
404 => "User not found",
}
}

get '/' do
User.all
end
#-------------------------------------------------------------------
# desc: find user bay id
# params: id
# return: user info
#--------------------------------------------------------------------
params do
requires :id, type: Integer, desc: "User id."
end
route_param :id do
get do
User.find(params[:id])
end
end
# end find user by id
=end
    # post /user
    desc "Create user", {
      nickname: "addUser",
    }
    params do
      requires :body,
      desc: "Created user"
    end
    post :user do
    end
    #--------------------------------------------------------------------
    # put /user
    desc "Edit user", {
      nickname: "editUser",
    }
    params do
      requires :body,
      desc: "Edit user"
    end
    put :user do
    end
    #---------------------------------------------------------------------
    # delete /user/{username}
    desc "Delete user", {
      nickname: "deleteUser",
      http_codes: {
        400 => "Invalid username supplied",
        404 => "User not found",
      }
    }
    params do
      requires :username, type: String, desc: "The name that needs to be deleted"
    end
    delete "/user/:username" do
    end
    #--------------------------------------------------------------------
    # get /user/{username}
    desc "Get user by user name", {
      nickname: "getUserById",
      http_codes: {
        400 => "Invalid username supplied",
        404 => "User not found",
      }
    }
    params do
      requires :username, type: String, desc: "The name that needs to be fetched. Use user1 for testing."
    end
    get "/user/:username" do
    end
    #--------------------------------------------------------------------
    # post /user/login
    desc "Logs user into the system", {
      nickname: "getUserById",
      http_codes: {
        400 => "Invalid username and password combination",
      }
    }
    params do
      requires :email, type: String, desc: "The user name for login"
      requires :password, type: String, desc: "The password for login in clear text"
    end
    post "/user/login" do
      #coding
      user = User.find_by_email(params[:email])
      user if user.valid_password?(params[:password])
      #user.authenticate(params[:password])
    end
    #--------------------------------------------------------------------
    # get /user/logout
    desc "Logs out current logged in user session", {
      nickname: "getUserById",
    }
    get "/user/logout" do
    end
    #--------------------------------------------------------------------
  end
end
