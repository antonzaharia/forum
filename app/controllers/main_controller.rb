class MainController < ApplicationController
  def index
    flash.now[:alert] = 'Hello!'
  end
end
