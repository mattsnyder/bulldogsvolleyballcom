class HomepageController < ApplicationController
  helper_method :announcements, :recent_news

  def index
  end

  def announcements
    Announcement.all
  end

  def recent_news
    Story.all
  end

end
