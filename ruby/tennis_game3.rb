class TennisGame3
  SCORE_WORDS = ["Love", "Fifteen", "Thirty", "Forty"].freeze


  def initialize(player1Name, player2Name)
    @player1_name = player1Name
    @player2_name = player2Name
    @player1_score = @player2_score = 0
  end
     
  
  def won_point(player_name)
    if player_name == @player1_name
      @player1_score += 1
    else
      @player2_score += 1
    end
  end
  
  
  def score
    if (@player1_score < 4 and @player2_score < 4) and (@player1_score + @player2_score < 6)
      SCORE_WORDS[@player1_score] + "-" + (@player1_score == @player2_score ? "All" : SCORE_WORDS[@player2_score])
    else
      return "Deuce" if @player1_score == @player2_score
      
      winning_player_name = @player1_score > @player2_score ? @player1_name : @player2_name
      ((@player1_score - @player2_score).abs == 1 ? "Advantage " : "Win for ") + winning_player_name
    end
  end

end
