class Match
  include Curator::Model

  attr_accesor :opponent, :date, :time, :location, :result

  def initialize(args)
    super(args.merge(id: "#{args[:date.to_i]-args[:opponent]}"))
  end

end
