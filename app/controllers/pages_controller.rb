class PagesController < ApplicationController
  def index

    pp "lolka"
    pp @feed = current_user.feed

  end
end
