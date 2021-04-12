class TennisGame
  class Player
    attr_accessor :name, :score

    def initialize(_name)
      self.name = _name
      self.score = 0
    end

    # adds a point to the score
    #
    def add_point
      self.score += 1
    end

  end

end