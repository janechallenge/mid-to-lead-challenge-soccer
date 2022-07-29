#!/usr/bin/env ruby

require 'minitest/autorun'
require './lib/game.rb'

describe Game do
  before do
    @game = Game.new("San Jose Earthquakes 4, Santa Cruz Slugs 2")
  end

  describe "when score is calculated" do
    it "must have correct hash" do
      sample_score = { "San Jose Earthquakes" => 3, "Santa Cruz Slugs" => 0 }
      assert_equal @game.score, sample_score
    end
  end
end
