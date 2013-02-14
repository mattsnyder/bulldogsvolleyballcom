class NewsController < ApplicationController
  helper_method :story, :events, :news

  def show
  end

  def story
    Story.find(params[:id])
  end

  def index
  end

  def news
    Story.recent
  end

  def events
    Event.upcoming
  end
end
