# frozen_string_literal: true

# Game is used to parse result string and calculate score
class Game
  attr_reader :valid

  def initialize(result)
    regex = /([A-z ]+)([0-9]+),([A-z ]+)([0-9]+)/
    return unless regex.match?(result)

    @valid = true
    @team1, @score1, @team2, @score2 = regex.match(result).captures.map(&:strip)
  end

  def score
    calculation = @score1.to_i - @score2.to_i

    if calculation.positive?
      { @team1 => 3, @team2 => 0 }
    elsif calculation.zero?
      { @team1 => 1, @team2 => 1 }
    else
      { @team1 => 0, @team2 => 3 }
    end
  end

  def teams_who_played
    [@team1, @team2]
  end
end
