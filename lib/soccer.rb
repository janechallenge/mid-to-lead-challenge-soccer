class Game
  def initialize(result)
    regex = %r{([A-z ]+)([0-9]+),([A-z ]+)([0-9]+)}
    @team_1, @score_1, @team_2, @score_2 = regex.match(result).captures.map(&:strip)
  end

  def score
    calculation = @score_1.to_i - @score_2.to_i

    if calculation > 0
      return { @team_1 => 3, @team_2 => 0 }
    elsif calculation == 0
      return { @team_1 => 1, @team_2 => 1 }
    else
      return { @team_1 => 0, @team_2 => 3 }
    end
  end

  def teams_who_played
    return @team_1, @team_2
  end

  def pprint
  end
end

def display_scoreboard(scoreboard)
  sorted_board = scoreboard.sort_by{ |team, score| -score}
  puts sorted_board.first(3).map { |team, score| "#{team}, #{score} pt#{score > 1 ? "s" : ""}" }
end

teams = []
matchday = 1
scoreboard = {}
puts "Matchday #{matchday}"
IO.foreach("sample-input.txt") do |line|
  game = Game.new(line)

  if teams.include?(game.teams_who_played.first)
    display_scoreboard(scoreboard)
    teams = []
    puts "\n"
    matchday += 1
    puts "Matchday #{matchday}"
  end

  teams.push(*game.teams_who_played)

  scoreboard.merge!(game.score) { |team, old_score, new_score| old_score + new_score }
end

display_scoreboard(scoreboard)
