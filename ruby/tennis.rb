
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



class TennisGame2
  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1_points = 0
    @p2_points = 0
  end
      
  def won_point(player_name)
    if player_name == @player1_name
      p1_score()
    else
      p2_score()
    end
  end

  def score
    result = ""
    if (@p1_points == @p2_points and @p1_points < 3)
      if (@p1_points == 0)
        result = "Love"
      end
      if (@p1_points == 1)
        result = "Fifteen"
      end
      if (@p1_points == 2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@p1_points == @p2_points and @p1_points > 2)
      result = "Deuce"
    end
    
    p1_res = ""
    p2_res = ""
    if (@p1_points > 0 and @p2_points == 0)
      if (@p1_points == 1)
        p1_res = "Fifteen"
      end
      if (@p1_points == 2)
        p1_res = "Thirty"
      end
      if (@p1_points == 3)
        p1_res = "Forty"
      end
      p2_res = "Love"
      result = p1_res + "-" + p2_res
    end
    if (@p2_points > 0 and @p1_points == 0)
      if (@p2_points == 1)
        p2_res = "Fifteen"
      end
      if (@p2_points == 2)
        p2_res = "Thirty"
      end
      if (@p2_points == 3)
        p2_res = "Forty"
      end
      
      p1_res = "Love"
      result = p1_res + "-" + p2_res
    end
    
    if (@p1_points > @p2_points and @p1_points < 4)
      if (@p1_points == 2)
        p1_res = "Thirty"
      end
      if (@p1_points == 3)
        p1_res = "Forty"
      end
      if (@p2_points == 1)
        p2_res="Fifteen"
      end
      if (@p2_points == 2)
        p2_res = "Thirty"
      end
      result = p1_res + "-" + p2_res
    end
    if (@p2_points > @p1_points and @p2_points < 4)
      if (@p2_points == 2)
        p2_res = "Thirty"
      end
      if (@p2_points == 3)
        p2_res="Forty"
      end
      if (@p1_points == 1)
        p1_res = "Fifteen"
      end
      if (@p1_points == 2)
        p1_res = "Thirty"
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


  def p1_score
    @p1_points += 1
  end
  
  def p2_score
    @p2_points += 1
  end
end

class TennisGame3
  def initialize(player1Name, player2Name)
    @p1N = player1Name
    @p2N = player2Name
    @p1 = 0
    @p2 = 0
  end
      
  def won_point(n)
    if n == @p1N
        @p1 += 1
    else
        @p2 += 1
    end
  end
  
  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if (@p1 == @p2)
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1-@p2)*(@p1-@p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
