class TannisGame::Player
  attr_accessor :name, :score

  def initialize(_name)
    self.name = _name
    self.score = 0
  end

end