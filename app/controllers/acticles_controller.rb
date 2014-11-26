class ActiclesController < ApplicationController
  def index
    #all kinds of suff that server view
    @acticle = Acticle.all
    render json: @acticle
  end
end
