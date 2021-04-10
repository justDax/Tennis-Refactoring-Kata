class TennisGame2
  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1_points = 0
    @p2_points = 0
  end
      
  def won_point(player_name)
    if player_name == @player1_name
      @p1_points += 1
    else
      @p2_points += 1
    end
  end

  def score
    result = ""
    if (@p1_points == @p2_points)
      case @p1_points
        when 0
          result = "Love-All"
        when 1
          result = "Fifteen-All"
        when 2
          result = "Thirty-All"
        else
          result = "Deuce"
      end
    
    elsif (@p1_points < 4 && @p2_points < 4)
      p1_res =
        case @p1_points
          when 0
            "Love"
          when 1
            "Fifteen"
          when 2
            "Thirty"
          when 3
            "Forty"
        end
      
      p2_res =
        case @p2_points
          when 0
            "Love"
          when 1
            "Fifteen"
          when 2
            "Thirty"
          when 3
            "Forty"
        end
      
      result = p1_res + "-" + p2_res
    end

    

    if (@p1_points > @p2_points and @p2_points >= 3)
      result = "Advantage " + @player1_name
    end
    if (@p2_points > @p1_points and @p1_points >= 3)
      result = "Advantage " + @player2_name
    end
    if (@p1_points >= 4 and @p2_points >= 0 and (@p1_points - @p2_points) >= 2)
      result = "Win for " + @player1_name
    end
    if (@p2_points >= 4 and @p1_points >= 0 and (@p2_points - @p1_points) >= 2)
      result = "Win for " + @player2_name
    end
    result
  end

end