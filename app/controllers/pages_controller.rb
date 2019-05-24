class PagesController < ApplicationController
  def index

    if user_signed_in?
      @image = Image.new
     @feed = current_user.feed
     @images = Image.where(id: current_user.id)
   else
     @images = Image.all
   end

  end
end
