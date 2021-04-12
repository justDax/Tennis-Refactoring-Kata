require_relative "tennis_game/player"

class TennisGame
  
  # mapping for the scores of 3 or below
  SCORE_NUMBER_TO_WORD_MAP = [
    "Love",
    "Fifteen",
    "Thirty",
    "Forty"
  ].freeze

  attr_reader :players

  
  def initialize(player1_name, player2_name)
    @players = []
    @players << TennisGame::Player.new(player1_name)
    @players << TennisGame::Player.new(player2_name)
  end
     
  
  # returns a player by its name
  #
  def player(player_name)
    players.find{|player| player.name == player_name}
  end

  
  # Assigns a single point by player name
  #
  def won_point(player_name)
    _player = player(player_name)
    raise StandardError.new("No player names #{player_name} is playing in the current game") if _player.nil?
    _player.add_point
  end

  
  # Returns the match's score in words
  #
  def score
    p1_score = players.first.score 
    p2_score = players[1].score
    if p1_score == p2_score
      score_word = SCORE_NUMBER_TO_WORD_MAP[0..-2][p1_score]
      return score_word ? score_word + "-All" : "Deuce"
    elsif p1_score >= 4 || p2_score >= 4
      winning_player = players.sort{|a, b| a.score <=> b.score}.last
      return (p1_score - p2_score).abs == 1 ? "Advantage #{winning_player.name}" : "Win for #{winning_player.name}"
    else
      # here both players must have 3 points or less
      return players.map{|player| SCORE_NUMBER_TO_WORD_MAP[player.score] }.join("-")
    end
  end
  
end