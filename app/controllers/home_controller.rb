class HomeController < ApplicationController
  expose :next_matches

  def index
    self.next_matches = [
                         Match.new(opponent: "Hoban", date: Date.today, time: "5:30pm", location: "Archbishop Hoban", address: "1 Holy Cross Blvd, Akron, OH 44306"),
                         Match.new(opponent: "Kent", date: Date.today + 1.day, time: "5:30pm", location: "Stanton Middle School", address: "1175 Hudson Rd, Kent, OH 44240"),
                         Match.new(opponent: "Brunswick", date: Date.today + 2.days, time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
                         Match.new(opponent: "Hudson", date: Date.today + 5.days, time: "5:30pm", location: "Hudson High School", address: "2500 Hudson Aurora Rd, Hudson, OH 44236")
                         ]
  end
end
