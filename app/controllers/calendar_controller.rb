class CalendarController < ApplicationController
  helper_method :month, :selected_month, :next_month, :previous_month, :day_events, :events
  def index
    respond_to do |wants|
      wants.html
      wants.ics do
        render :text => Event.ical
      end
    end
  end

  def events
    @selected_months_events ||=
      Event.where(
                  :start_datetime.gte => selected_month.beginning_of_month.to_datetime.utc - 1.week, :end_datetime.lte => selected_month.end_of_month.to_time.to_datetime.utc + 1.week
                  )

  end

  def day_events(date, events)
    events.select { |e| e.start_datetime.day == date.day && e.start_datetime.month == date.month }
  end

  def selected_month
    year = params[:year].present? ? params[:year].to_i : Date.today.year
    month = params[:month].present? ? params[:month].to_i : Date.today.month
    Date.civil(year, month)
  end

  def next_month
    selected_month.next_month
  end

  def previous_month
    selected_month.prev_month
  end

  def month
    current_date   = Date.today
    range          = build_range selected_month
    build_month range
  end

  def build_range(selected_month)
    start_date = selected_month.beginning_of_month
    start_date = start_date.sunday? ? start_date : start_date.beginning_of_week(:sunday)

    end_date   = selected_month.end_of_month
    end_date   = end_date.saturday? ? end_date : end_date.end_of_week(:sunday)

    (start_date..end_date).to_a
  end

  def build_month(date_range)
    month = []
    week  = []
    i     = 0

    date_range.each do |date|
      week << date
      if i == 6
        i = 0
        month << week
        week = []
      else
        i += 1
      end
    end

    month
  end
end
