class MatchRepository
  include Curator::Repository

  indexed_fields :date

  def self.next(count)
    all.select{|m| m.date > Date.yesterday }.sort{|x,y| x.date <=> y.date}.slice(0, count)
  end

  def self.all
    [
     Match.new(opponent: "Super Scrimmage", date: Date.parse("2014/3/15"), time: "9:00am", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     Match.new(opponent: "Hoban", date: Date.parse("2014/3/21"), time: "6:00pm", location: "Archbishop Hoban", address: "1 Holy Cross Blvd, Akron, OH 44306"),
     Match.new(opponent: "Massilon-Jackson", date: Date.parse("2014/4/1"), time: "6:30pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     Match.new(opponent: "Kent Roosevelt", date: Date.parse("2014/4/3"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     Match.new(opponent: "Hoban", date: Date.parse("2014/4/8"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     Match.new(opponent: "Brunswick", date: Date.parse("2014/4/10"), time: "7:00pm", location: "Visintainer Middle School", address: "1459 Pearl Road, Brunswick, OH 44212"),
     Match.new(opponent: "Hudson", date: Date.parse("2014/4/15"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     Match.new(opponent: "St. Eds", date: Date.parse("2014/4/17"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     Match.new(opponent: "Medina", date: Date.parse("2014/4/22"), time: "6:00pm", location: "Medina High School", address: "777 E Union St, Medina, Ohio 44256"),
     Match.new(opponent: "Walsh", date: Date.parse("2014/4/24"), time: "5:30pm", location: "Walsh Jesuit High School", address: "4550 Wyoga Lake Rd, Cuyahoga Falls, OH 44224"),
     Match.new(opponent: "Maroon & Gold", date: Date.parse("2014/4/26"), time: "9:00am", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     Match.new(opponent: "Medina", date: Date.parse("2014/4/28"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     Match.new(opponent: "North Royalton", date: Date.parse("2014/4/29"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     Match.new(opponent: "Hudson", date: Date.parse("2014/4/30"), time: "6:00pm", location: "Hudson High School", address: "2500 Hudson Aurora Rd, Hudson, OH 44236"),
     Match.new(opponent: "Brecksville", date: Date.parse("2014/5/2"), time: "5:30pm", location: "Brecksville High School", address: "6376 Mill Rd, Cleveland, OH 44147"),
     Match.new(opponent: "Kent", date: Date.parse("2014/5/6"), time: "6:00pm", location: "Stanton Middle School", address: "1175 Hudson Rd, Kent, OH 44240")
    ]
  end
end
