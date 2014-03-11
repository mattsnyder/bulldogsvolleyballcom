class Match
  include Curator::Model

  attr_accessor :opponent, :date, :time, :location, :address, :result, :notes, :tournament

  def initialize(args)
    super(args.merge(id: "#{args[:date].strftime("%Y%m%d%H%M%S")}-#{args[:opponent]}"))
  end

end
