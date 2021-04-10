class TennisGame3
  SCORE_WORDS = ["Love", "Fifteen", "Thirty", "Forty"].freeze


  def initialize(player1Name, player2Name)
    @players = {}               # This hash represents the players with a playerName as the key and his/her score as value
                                # while with this logic won't work when both players have the same name, 
                                # I assume that this case will never happen otherwise it won't be possible 
                                # to add points by player name too
    @players[player1Name] = 0
    @players[player2Name] = 0
  end
     
  
  def won_point(player_name)
    @players[player_name] += 1
  end
  

  def scores
    @players.values
  end

  
  # the #player1_score and the #player2_score methods have been added for readability
  def player1_score
    scores.first
  end
  
  def player2_score
    scores[1]
  end

  

  def score
    if (player1_score < 4 and player2_score < 4) && scores.sum < 6
      SCORE_WORDS[player1_score] + "-" + (player1_score == player2_score ? "All" : SCORE_WORDS[player2_score])
    else
      return "Deuce" if player1_score == player2_score
      (scores.inject(&:-).abs == 1 ? "Advantage " : "Win for ") + @players.key(scores.max)
    end
  end

end
