class HomepageController < ApplicationController
  helper_method :announcements, :recent_news, :schedule

  def index
  end

  def announcements
    Announcement.all
  end

  def recent_news
    Story.all
  end

  def schedule
    Event.all
  end

end
