class ScheduleController < ApplicationController
  expose :matches

  def index
    self.matches = MatchRepository.all.sort{|x,y| x.date <=> y.date}
  end
end
