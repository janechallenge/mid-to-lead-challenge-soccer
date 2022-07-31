#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/counter'

counter = Counter.new
case ARGV.length
when 0
  # handle data from STDIN
  $stdin.read.split("\n").each do |line|
    counter.new_game_result(line)
  end
when 1
  # handle data from file
  File.foreach(ARGV.first) do |line|
    counter.new_game_result(line)
  end
else
  puts 'Too many arguments have been provided'
end

# if data streaming is halted, display in-progress scoreboard
counter.display_scoreboard
