class HomeController < ApplicationController
  expose :next_matches

  def index
    self.next_matches = MatchRepository.next(4)
  end
end
