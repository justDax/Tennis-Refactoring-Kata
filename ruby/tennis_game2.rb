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
    if @p1_points == @p2_points
      result = @p1_points >= 3 ? "Deuce" : points_to_word(@p1_points) + "-All"
    
    elsif @p1_points < 4 && @p2_points < 4
      p1_res = points_to_word(@p1_points)
      p2_res = points_to_word(@p2_points)
      
      result = p1_res + "-" + p2_res
    else
      if @p1_points > @p2_points
        result = (@p1_points - @p2_points) >= 2 ? "Win for " + @player1_name : "Advantage " + @player1_name
      else
        result = (@p2_points - @p1_points) >= 2 ? "Win for " + @player2_name : "Advantage " + @player2_name
      end
    end

    result
  end


  def points_to_word(points)
    case points
      when 0
        "Love"
      when 1
        "Fifteen"
      when 2
        "Thirty"
      when 3
        "Forty"
    end
  end

end