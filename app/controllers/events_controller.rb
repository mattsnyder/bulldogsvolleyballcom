class EventsController < ApplicationController
  helper_method :event, :events

  def show
  end

  def event
    @event ||= Event.find(params[:id])
  end

  def events
    Event.upcoming
  end
end
