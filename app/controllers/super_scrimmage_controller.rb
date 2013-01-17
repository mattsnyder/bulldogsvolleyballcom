class SuperScrimmageController < ApplicationController
  helper_method :events

  def events
    Event.upcoming
  end
end
