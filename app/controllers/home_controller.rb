class HomeController < ApplicationController

  def index
    redirect_to :ianne
  end

  def ianne
    render :template => "ianne"
  end

end
