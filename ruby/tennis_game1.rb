class TennisGame1
  
  # mapping for the scores of 3 or below
  SCORE_NUMBER_TO_WORD_HASH = {
    0 => "Love",
    1 => "Fifteen",
    2 => "Thirty",
    3 => "Forty",
  }.freeze


  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1_points = 0
    @p2_points = 0
  end
        
  
  # Assigns a single point by player name
  #
  def won_point(player_name)
    case player_name
      when @player1_name
        @p1_points += 1
      when @player2_name
        @p2_points += 1
      else
        raise StandardError.new("No player names #{player_name} is playing in the current game")  
    end
  end

  
  # Returns the match's score in words
  #
  def score
    if @p1_points == @p2_points
      score_word = SCORE_NUMBER_TO_WORD_HASH.reject{|key| key == 3}[@p1_points]
      return score_word ? score_word + "-All" : "Deuce"
    elsif @p1_points >= 4 or @p2_points >= 4
      score_difference = @p1_points - @p2_points
      winning_player = @p1_points > @p2_points ? @player1_name : @player2_name
      return score_difference.abs == 1 ? "Advantage #{winning_player}" : "Win for #{winning_player}"
    else
      # here both players must have 3 points or less
      return [@p1_points, @p2_points].map{|points| SCORE_NUMBER_TO_WORD_HASH[points] }.join("-")
    end
  end
  
end