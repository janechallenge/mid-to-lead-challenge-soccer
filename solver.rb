require './lib/game.rb'

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
