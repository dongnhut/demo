module V1
  class Users < Grape::API
    
    #before_filter :require_no_authentication, only: :new 
    desc "List all user", {
      headers: {
        "access_token" => {
          description: "Valdates your identity",
          required: false
        }
      }
    }
    get '/'  do
      #
      #header
      #current_user
      authenticate!
      User.all
    end
    #---------------------------------------------------------------
    # post /create
    desc "Create user", {
      nickname: "addUser",
    }
    params do
      requires :body,
      desc: "Created user"
    end
    post :create do
    end
    #--------------------------------------------------------------------
    # put /edit
    desc "Edit user", {
      nickname: "editUser",
    }
    params do
      requires :body,
      desc: "Edit user"
    end
    put :edit do
     #authenticate!
     return params[:user];
     
    end
    #---------------------------------------------------------------------
    # delete /delete/{username}
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
    delete "/delete/:username" do
    end
    #--------------------------------------------------------------------
    # get /getuser/{username}
    desc "Get user by user name", {
      nickname: "getUserByUserName",
      http_codes: {
        400 => "Invalid username supplied",
        404 => "User not found",
      }
    }
    params do
      requires :username, type: String, desc: "The name that needs to be fetched."
    end
    get "/getuser/:username" do
    end
    #--------------------------------------------------------------------
  end
end
