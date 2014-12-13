module V1
  class Auth < Grape::API

    # post /login
    desc "Logs user into the system", {
      nickname: "getUser",
      http_codes: {
        400 => "Invalid username and password combination",
      }
    }

    params do
      requires :email, type: String, desc: "The user name for login"
      requires :password, type: String, desc: "The password for login in clear text"
    end
    post "/login" do

      user = User.find_by_email(params[:email].downcase)
      
      if user && user.valid_password?(params[:password])
        key = ApiKey.create(user_id: user.id)
        #{token: key.access_token}
        return {
          :meta => {
            :code => 201,
            :message => "Login successful",
            :version => "1.0",
            :encoding=> "UTF-8",
            :language=> "en"
          },
          :data=> {
            :user=> user,
            :access_token => key.access_token
          }
        }
      else
        error!('Unauthorized.', 401)
      end
    end
    #--------------------------------------------------------------------
    # get /user/logout
    desc "Logs out current logged in user session", {
      nickname: "logoutUser",
    }
    get "/logout" do
      warden.logout
    end
  end
end