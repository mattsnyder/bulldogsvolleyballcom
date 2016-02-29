class MatchRepository
  include Curator::Repository

  indexed_fields :date

  def self.next(count)
    all.select{|m| m.date > Date.yesterday }.sort{|x,y| x.date <=> y.date}.slice(0, count)
  end

  def self.all
    [
     # Match.new(opponent: "Super Scrimmage", date: Date.parse("2014/3/15"), time: "9:00am", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     # Match.new(opponent: "Hoban", date: Date.parse("2014/3/21"), time: "6:00pm", location: "Archbishop Hoban", address: "1 Holy Cross Blvd, Akron, OH 44306"),
     # Match.new(opponent: "Massilon-Jackson", date: Date.parse("2014/4/1"), time: "6:30pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Kent Roosevelt", date: Date.parse("2014/4/3"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Hoban", date: Date.parse("2014/4/8"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Brunswick", date: Date.parse("2014/4/10"), time: "7:00pm", location: "Visintainer Middle School", address: "1459 Pearl Road, Brunswick, OH 44212"),
     # Match.new(opponent: "Hudson", date: Date.parse("2014/4/15"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "St. Eds", date: Date.parse("2014/4/17"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Medina", date: Date.parse("2014/4/22"), time: "6:00pm", location: "Medina High School", address: "777 E Union St, Medina, Ohio 44256"),
     # Match.new(opponent: "Walsh", date: Date.parse("2014/4/24"), time: "5:30pm", location: "Walsh Jesuit High School", address: "4550 Wyoga Lake Rd, Cuyahoga Falls, OH 44224"),
     # Match.new(opponent: "Maroon & Gold", date: Date.parse("2014/4/26"), time: "9:00am", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     # Match.new(opponent: "Medina", date: Date.parse("2014/4/28"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "North Royalton", date: Date.parse("2014/4/29"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Hudson", date: Date.parse("2014/4/30"), time: "6:00pm", location: "Hudson High School", address: "2500 Hudson Aurora Rd, Hudson, OH 44236"),
     # Match.new(opponent: "Brecksville", date: Date.parse("2014/5/2"), time: "5:30pm", location: "Brecksville High School", address: "6376 Mill Rd, Cleveland, OH 44147"),
     # Match.new(opponent: "Kent", date: Date.parse("2014/5/6"), time: "6:00pm", location: "Stanton Middle School", address: "1175 Hudson Rd, Kent, OH 44240"),
     # Match.new(opponent: "Regional Playoff vs Medina", tournament: true, date: Date.parse("2014/5/13"), time: "6:30pm", location: "Walsh Jesuit High School", address: "4550 Wyoga Lake Rd, Cuyahoga Falls, OH 44224"),
     # Match.new(opponent: "Regional Playoff Semi-Final", tournament: true, date: Date.parse("2014/5/17"), time: "10:00am", location: "Archbishop Hoban", address: "1 Holy Cross Blvd, Akron, OH 44306"),
     # Match.new(opponent: "Youth Mini Camp", date: Date.parse("2014/5/22"), time: "5:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true )


     # Match.new(opponent: "Open Gym", date: Date.parse("2015/3/2"), time: "5:30pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     # Match.new(opponent: "Tryouts (JV/V)", date: Date.parse("2015/3/9"), time: "6:30pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     # Match.new(opponent: "Medina (V Scrimmage)", date: Date.parse("2015/3/17"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     # Match.new(opponent: "Super Scrimmage (V)", date: Date.parse("2015/3/21"), time: "9:00am", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     # Match.new(opponent: "Pickerington N. (V Quad)", date: Date.parse("2015/3/28"), time: "9:00am", location: "Pickerington North HS", address: "7800 Refugee Rd, Pickerington, OH 43147", tournament: true ),
     # Match.new(opponent: "Kent (JV/V)", date: Date.parse("2015/3/31"), time: "6:00pm", location: "Stanton Middle School", address: "1175 Hudson Rd, Kent, OH 44240"),
     # Match.new(opponent: "N. Royalton (JV/V)", date: Date.parse("2015/4/2"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Medina (JV/V)", date: Date.parse("2015/4/7"), time: "6:00pm", location: "Medina High School", address: "777 E Union St, Medina, Ohio 44256"),
     # Match.new(opponent: "Hudson (JV/V)", date: Date.parse("2015/4/9"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Maroon & Gold (V)", date: Date.parse("2015/4/11"), time: "9:00am", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     # Match.new(opponent: "Jackson (JV/V)", date: Date.parse("2015/4/14"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "St Vincent (JV/V)", date: Date.parse("2015/4/16"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Lake Cath. (JV/V)", date: Date.parse("2015/4/20"), time: "6:00pm", location: "Lake Catholic HS", address: "6733 Reynolds Rd, Mentor, OH 44060"),
     # Match.new(opponent: "Kent (JV/V)", date: Date.parse("2015/4/23"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Jackson Tournament (V)", date: Date.parse("2015/4/25"), time: "9:00am", location: "Jackson High School", address: "7600 Fulton Rd NW, Massillon, OH", tournament: true),
     # Match.new(opponent: "Hoban (JV/V)", date: Date.parse("2015/4/27"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Brecksville (JV/V)", date: Date.parse("2015/4/28"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "Medina (JV/V)", date: Date.parse("2015/4/30"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224"),
     # Match.new(opponent: "v. Brunswick,Holy Name (V)", date: Date.parse("2015/5/2"), time: "10:00am", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true),
     # Match.new(opponent: "St Edwards (JV/V)", date: Date.parse("2015/5/5"), time: "6:00pm", location: "St Edwards High School", address: "13500 Detroit Ave, Lakewood, OH 44107"),
     # Match.new(opponent: "Hudson (JV/V)", date: Date.parse("2015/5/8"), time: "6:00pm", location: "Hudson High School", address: "2500 Hudson Aurora Rd, Hudson, OH 44236"),
     # Match.new(opponent: "Walsh (JV/V)", date: Date.parse("2015/5/12"), time: "6:00pm", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224")

     Match.new(opponent: "Open Gym", date: Date.parse("2016/03/04"), time: "6:00PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     Match.new(opponent: "Tryouts", date: Date.parse("2016/03/07"), time: "3:00PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     Match.new(opponent: "Hudson", date: Date.parse("2016/03/30"), time: "7:30PM", location: "Hudson High School", address: "2500 Hudson Aurora Rd, Hudson, OH 44236", tournament: false ),
     Match.new(opponent: "Polar Bear Bash", date: Date.parse("2016/04/02"), time: "8:00AM", location: "Jackson High School", address: "7600 Fulton Rd NW, Massillon, OH", tournament: true ),
     Match.new(opponent: "Kent", date: Date.parse("2016/04/04"), time: "7:30PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: false ),
     Match.new(opponent: "Medina", date: Date.parse("2016/04/05"), time: "7:30PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: false ),
     Match.new(opponent: "Perry", date: Date.parse("2016/04/07"), time: "6:30PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: false ),
     Match.new(opponent: "Brunswick (Tri)", date: Date.parse("2016/04/09"), time: "9:30AM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     Match.new(opponent: "VASJ (Tri)", date: Date.parse("2016/04/09"), time: "12:30PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: true ),
     Match.new(opponent: "Walsh", date: Date.parse("2016/04/12"), time: "7:30PM", location: "Walsh Jesuit HS", address: "4550 Wyoga Lake Rd, Cuyahoga Falls, OH 44224", tournament: false ),
     Match.new(opponent: "Hudson", date: Date.parse("2016/04/14"), time: "7:30PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: false ),
     Match.new(opponent: "Pickerington North (Quad)", date: Date.parse("2016/04/16"), time: "10:00AM", location: "Pickerington North HS", address: "7800 Refugee Rd, Pickerington, OH 43147", tournament: true ),
     Match.new(opponent: "Beavercreek (Quad)", date: Date.parse("2016/04/16"), time: "11:15AM", location: "Pickerington North HS", address: "7800 Refugee Rd, Pickerington, OH 43147", tournament: true ),
     Match.new(opponent: "St Charles (Quad)", date: Date.parse("2016/04/16"), time: "12:30PM", location: "Pickerington North HS", address: "7800 Refugee Rd, Pickerington, OH 43147", tournament: true ),
     Match.new(opponent: "North Royalton", date: Date.parse("2016/04/19"), time: "6:30PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: false ),
     Match.new(opponent: "St. Ignatius", date: Date.parse("2016/04/21"), time: "7:30PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: false ),
     Match.new(opponent: "Spike for Tykes", date: Date.parse("2016/04/23"), time: "8:00AM", location: "Capital Center", address: "Capital University, Columbus, OH 43209", tournament: true ),
     Match.new(opponent: "St. Ed's", date: Date.parse("2016/04/26"), time: "6:30PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: false ),
     Match.new(opponent: "Kent", date: Date.parse("2016/04/28"), time: "7:30PM", location: "Stanton Middle School", address: "1175 Hudson Rd, Kent, OH 44240"),
     Match.new(opponent: "Medina", date: Date.parse("2016/05/02"), time: "7:30PM", location: "Medina High School", address: "777 E Union St, Medina, Ohio 44256"),
     Match.new(opponent: "Hoban", date: Date.parse("2016/05/04"), time: "7:30PM", location: "Archbishop Hoban", address: "1 Holy Cross Blvd, Akron, OH 44306"),
     Match.new(opponent: "Brecksville", date: Date.parse("2016/05/10"), time: "7:30PM", location: "Stow High School", address: "3227 Graham Rd, Stow, OH 44224", tournament: false )
    ]
  end
end
