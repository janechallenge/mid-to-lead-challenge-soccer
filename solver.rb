#!/usr/bin/env ruby

require_relative 'lib/counter.rb'

counter = Counter.new
if ARGV.length == 0
  # handle data from STDIN
  STDIN.read.split("\n").each do |line|
    counter.new_game_result(line)
  end
elsif ARGV.length == 1
  # handle data from file
  IO.foreach(ARGV.first) do |line|
    counter.new_game_result(line)
  end
else
  puts "Too many arguments have been provided"
end

# if data streaming is halted, display in-progress scoreboard
counter.display_scoreboard
