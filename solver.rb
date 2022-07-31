#!/usr/bin/env ruby

require './lib/game.rb'

def display_scoreboard(scoreboard)
  sorted_board = scoreboard.sort_by{ |team, score| [-score, team] }
  puts sorted_board.first(3).map { |team, score| "#{team}, #{score} pt#{score > 1 ? "s" : ""}" }
end

def process_line(line)
  game = Game.new(line)
  return unless game.valid

  if $teams.include?(game.teams_who_played.first)
    display_scoreboard($scoreboard)
    $teams = []
    puts "\n"
    $matchday += 1
    puts "Matchday #{$matchday}"
  end

  $teams.push(*game.teams_who_played)

  $scoreboard.merge!(game.score) { |team, old_score, new_score| old_score + new_score }
end

$teams = []
$matchday = 1
$scoreboard = {}

if ARGV.length == 0
  # handle with STDIN
  puts "Matchday #{$matchday}"
  STDIN.read.split("\n").each do |line|
    process_line(line)
  end
elsif ARGV.length == 1
  # handle by reading file
  puts "Matchday #{$matchday}"
  IO.foreach(ARGV.first) do |line|
    process_line(line)
  end
else
  puts "You have provided too many arguments"
end

# if data streaming is halted, display in-progress scoreboard
display_scoreboard($scoreboard)
