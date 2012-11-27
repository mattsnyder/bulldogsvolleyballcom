class NewsController < ApplicationController
  helper_method :news
  
  def show
  end

  def index
  end

  def news
    Story.all
  end
end
