# frozen_string_literal: true

require_relative 'game'

# Counter is used to keep track of matchday, teams who played and scoreboard
class Counter
  def initialize
    @day = 1
    @teams = []
    @scoreboard = {}
    puts "Matchday #{@day}"
  end

  def display_scoreboard
    sorted_board = @scoreboard.sort_by { |team, score| [-score, team] }
    formatted_board = sorted_board.first(3).map { |team, score| "#{team}, #{score} pt#{score > 1 ? 's' : ''}" }
    puts formatted_board
  end

  def new_game_result(result)
    game = Game.new(result)
    return unless game.valid

    if @teams.include?(game.teams_who_played.first)
      display_scoreboard

      @teams = []
      @day += 1

      puts "\nMatchday #{@day}"
    end

    @teams.push(*game.teams_who_played)
    @scoreboard.merge!(game.score) { |_team, old_score, new_score| old_score + new_score }
  end
end
