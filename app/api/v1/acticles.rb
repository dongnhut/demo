module V1
  class Acticles < Grape::API

    #-------------------------------------------------------------------
    # List all acticles
    #-------------------------------------------------------------------
    get '/' do
      Acticle.all
    end

  #
    params do
      requires :name, type: String, desc: "The acticle name."
    end
    post '/new' do
      Acticle.create!({name: params[:name]})
    end

  end
end
