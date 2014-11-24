class RockPaperScissors

  RULES = { "R" => 1, "P" => 2, "S" => 3 }
  
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless RULES.key?(player1[1]) and RULES.key?(player2[1])
    diff = (RULES[player1[1]] - RULES[player2[1]]) % 3
    if diff == 0
      player1
    elsif diff < 2
      player1
    else
      player2
    end
  end

  def self.tournament_winner(tournament)
    player1 = tournament[0]
    player2 = tournament[1]
    if player1[0].is_a?(String) && player2[0].is_a?(String)
      return winner(player1, player2)
    else 
      winner(tournament_winner(player1), tournament_winner(player2))
    end
  end
end
