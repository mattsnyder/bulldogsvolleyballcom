class NewsController < ApplicationController
  helper_method :news, :events

  def show
  end

  def index
  end

  def news
    Story.all
  end

  def events
    Event.all
  end
end
