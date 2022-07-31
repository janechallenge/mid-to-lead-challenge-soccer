#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/game'

describe Game do
  describe 'when game is parsed' do
    it 'must validate valid strings' do
      game = Game.new('Team A 1, Team B 2')
      assert_equal game.valid, true
    end

    it 'must invalidate strings with missing comma' do
      game = Game.new('Team A 1 Team B 2')
      assert_nil game.valid
    end

    it 'must invalidate strings with missing score' do
      game = Game.new('Team A 1, Team B')
      assert_nil game.valid
    end

    it 'must invalidate strings with missing team name' do
      game = Game.new('1, Team B 2')
      assert_nil game.valid
    end
  end

  describe 'when score is calculated' do
    it 'must have teams as hash keys' do
      game = Game.new('Team A 1, Team B 2')
      assert_equal game.score.keys, ['Team A', 'Team B']
    end

    it 'can correctly score a draw game' do
      game = Game.new('Team A 2, Team B 2')
      assert_equal game.score.values, [1, 1]
    end

    it 'can correctly score a non-draw game' do
      game = Game.new('Team A 2, Team B 4')
      assert_equal game.score, { 'Team A' => 0, 'Team B' => 3 }
    end
  end

  describe 'when teams_who_played is called' do
    it "must match the game's teams" do
      game = Game.new('Team A 1, Team B 2')
      assert_equal game.teams_who_played, ['Team A', 'Team B']
    end
  end
end
