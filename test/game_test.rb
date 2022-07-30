#!/usr/bin/env ruby

require 'minitest/autorun'
require './lib/game.rb'

describe Game do
  describe "when score is calculated" do
    it "must have teams as hash keys" do
      @game = Game.new("Team A 1, Team B 2")
      assert_equal @game.score.keys, ["Team A", "Team B"]
    end

    it "can correctly score a draw game" do
      @game = Game.new("Team A 2, Team B 2")
      assert_equal @game.score.values, [1, 1]
    end

    it "can correctly score a non-draw game" do
      @game = Game.new("Team A 2, Team B 4")
      assert_equal @game.score, { "Team A" => 0, "Team B" => 3 }
    end
  end

  describe "when teams_who_played is called" do
    it "must match the game's teams" do
      @game = Game.new("Team A 1, Team B 2")
      assert_equal @game.teams_who_played, ["Team A", "Team B"]
    end
  end
end
