class HomepageController < ApplicationController
  helper_method :announcements

  def index
  end

  def announcements
    Announcement.all
  end

end
