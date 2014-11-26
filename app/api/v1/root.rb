module V1
  class Root < Grape::API

    #-------------------------------------------------------------------
    #
    #-------------------------------------------------------------------
    namespace :user do
      mount V1::Users
    end
    # end namespage user

    namespace :acticle do
      mount V1::Acticles
    end

  end
end