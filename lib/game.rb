class Game
  attr_reader :valid

  def initialize(result)
    regex = %r{([A-z ]+)([0-9]+),([A-z ]+)([0-9]+)}
    if regex.match?(result)
      @valid = true
      @team_1, @score_1, @team_2, @score_2 = regex.match(result).captures.map(&:strip)
    end
  end

  def score
    calculation = @score_1.to_i - @score_2.to_i

    if calculation > 0
      { @team_1 => 3, @team_2 => 0 }
    elsif calculation == 0
      { @team_1 => 1, @team_2 => 1 }
    else
      { @team_1 => 0, @team_2 => 3 }
    end
  end

  def teams_who_played
    [@team_1, @team_2]
  end
end
