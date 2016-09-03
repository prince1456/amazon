class ContactController < ApplicationController
  def contact

  end
  def create
    @name = params[:name]
    @email = params[:email]
    @massage = params[:massage]
  end

end
