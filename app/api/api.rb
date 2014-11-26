#require 'grape-swagger'

module Api
  class Demo < Grape::API

    before do
      header["Access-Control-Allow-Origin"]   = "*"
      header["Access-Control-Request-Method"] = "*"
    end

    prefix 'api'
    format 'json'

    error_formatter :json, ErrorFormatter
    #error_formatter :json, lambda { |message, backtrace, options, env|"error: #{message} from #{backtrace}"}

    before do
      #error!("401 Unauthorized", 401) unless authenticated
    end

    helpers do
      def warden
        env['warden']
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
      end

      def current_user
        warden.user || @user
      end
    end

    mount V1::Root
    
    #add_swagger_documentation
    # Docs
    add_swagger_documentation  mount_path: "/api-docs",
                               api_version: "1.0.0",
                               info: {
                                  contact: "vodongnhut@gmail.com",
                                  description: %Q(This is a sample server.  You can find out more about Swagger \n    at <a href="http://swagger.wordnik.com">http://swagger.wordnik.com</a> or on irc.freenode.net, #swagger.  For this sample,\n    you can use the api key "special-key" to test the authorization filters),
                                  license: "Apache 2.0",
                                  license_url: "http://www.apache.org/licenses/LICENSE-2.0.html",
                                  terms_of_service_url: "http://helloreverb.com/terms/",
                                  title: "Sample App"
                               },
                               markdown: false,
                               hide_documentation_path: true,
                               hide_format: true,
                               include_base_url: true
    
  end
end