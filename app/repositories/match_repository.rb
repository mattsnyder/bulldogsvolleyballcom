class MatchRepository
  include Curator::Repository

  indexed_fields :date
end
