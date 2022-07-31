#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/counter'

describe Counter do
  describe 'when counter is initialized' do
    it 'must output Matchday #' do
      assert_output("Matchday 1\n") { Counter.new }
    end
  end

  describe 'when scoreboard is displayed' do
    it 'must output correct scoreboard' do
      counter = Counter.new
      counter.new_game_result('Team A 2, Team B 2')
      counter.new_game_result('Team A 3, Team B 1')
      counter.new_game_result('Team A 1, Team B 3')
      counter.new_game_result('Team A 4, Team B 2')

      assert_output("Team A, 7 pts\nTeam B, 4 pts\n") { counter.display_scoreboard }
    end

    it 'must output teams in alphabetical order when same score' do
      counter = Counter.new
      counter.new_game_result('Team B 0, Team A 0')

      assert_output("Team A, 1 pt\nTeam B, 1 pt\n") { counter.display_scoreboard }
    end
  end

  describe 'when counter processes game result' do
    it 'must stay silent if matchday has not finished' do
      counter = Counter.new
      assert_silent { counter.new_game_result('Team A 1, Team B 2') }
    end

    it 'must display scoreboard and new matchday # if matchday has ended' do
      counter = Counter.new
      counter.new_game_result('Team A 3, Team B 2')
      assert_output("Team A, 3 pts\nTeam B, 0 pt\n\nMatchday 2\n") { counter.new_game_result('Team A 1, Team B 2') }
    end
  end
end
