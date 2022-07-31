require_relative 'game.rb'

class Counter
  def initialize
    @day = 1
    @teams = []
    @scoreboard = {}
    puts "Matchday #{@day}"
  end

  def display_scoreboard
    sorted_board = @scoreboard.sort_by{ |team, score| [-score, team] }
    puts sorted_board.first(3).map { |team, score| "#{team}, #{score} pt#{score > 1 ? "s" : ""}" }
  end

  def new_game_result(result)
    game = Game.new(result)
    return unless game.valid

    if @teams.include?(game.teams_who_played.first)
      display_scoreboard

      @teams = []
      @day += 1

      puts "\n"
      puts "Matchday #{@day}"
    end

    @teams.push(*game.teams_who_played)
    @scoreboard.merge!(game.score) { |team, old_score, new_score| old_score + new_score }
  end
end
