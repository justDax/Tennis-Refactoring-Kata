class TennisGame2
  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1_points = 0
    @p2_points = 0
  end
      

  # Assigns 1 point to a player given its name
  #
  def won_point(player_name)
    if player_name == @player1_name
      @p1_points += 1
    elsif player_name == @player2_name
      @p2_points += 1
    end
  end
  

  def score
    if @p1_points == @p2_points
      return @p1_points >= 3 ? "Deuce" : points_to_word(@p1_points) + "-All"
    elsif @p1_points < 4 && @p2_points < 4
      return points_to_word(@p1_points) + "-" + points_to_word(@p2_points)
    else
      winning_player = @p1_points > @p2_points ? @player1_name : @player2_name
      points_diff = (@p1_points - @p2_points).abs
      return points_diff >= 2 ? "Win for #{winning_player}" : "Advantage #{winning_player}"
    end
  end


  # Converts scores from 0 to 3 into words
  #
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