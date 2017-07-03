require 'csv'

module GameState
  class GameOver
    attr_reader :name, :completed

    def initialize
      @completed = false
      @name = :game_over
    end

    def run
      Curses.clear
      
      # Check for user 
      player_input = Curses.getch
      exit(1) if player_input =~ /q/i

      msg = "Thanks for Playing! Press 'q' to quit\n"
      Curses.setpos(0, 0)
      Curses.addstr(msg)
      Curses.setpos(2,10)
      Curses.addstr(ascii_thing) 

      # print_high_scores

      Curses.refresh
      sleep 0.1
    end

    private 

    def ascii_thing
      %Q(
       _______ __         __         _______                              
       |   |   |__|.-----.|  |--.    |     __|.----.-----.----.-----.-----.
       |       |  ||  _  ||     |    |__     ||  __|  _  |   _|  -__|__ --|
       |___|___|__||___  ||__|__|    |_______||____|_____|__| |_____|_____|
                   |_____|                                                 
      )
    end

    def print_high_scores
      line_num = 5
      CSV.foreach('./assets/high_scores.csv') do |f|
        Curses.setpos(line_num, 10)
        Curses.addstr(f.join(' '))
        line_num += 1
      end
    end
  end
end


