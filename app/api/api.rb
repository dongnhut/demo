module Api
  class Demo < Grape::API

    before do
      header["Access-Control-Allow-Origin"]   = "*"
      header["Access-Control-Request-Method"] = "*"
    end

    prefix 'api'
    format 'json'

    error_formatter :json, ErrorFormatter

    helpers do
      
      def authenticate!
        error!('Unauthorized. Invalid or expired token.', 401) unless current_user
      end
  
      def current_user
        # find token. Check if valid.
        token = ApiKey.where(access_token: headers['Access-Token']).first
        if token && !token.expired?
          @current_user = User.find(token.user_id)
        else
          false
        end
      end   
    end

    mount V1::Root

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