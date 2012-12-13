class HomepageController < ApplicationController
  helper_method :announcements, :recent_news, :schedule

  def index
  end

  def announcements
    Announcement.desc(:publish_time).limit(3)
  end

  def recent_news
    Story.desc(:publish_time).limit(3)
  end

  def schedule
    Event.upcoming
  end

end
