class NewsController < ApplicationController
  helper_method :news, :events

  def show
  end

  def index
  end

  def news
    Story.desc(:publish_time).limit(20)
  end

  def events
    Event.upcoming
  end
end
