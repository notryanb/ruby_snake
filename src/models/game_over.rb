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

      msg = "Thanks for Playing! Press 'q' to quit"
      Curses.setpos(0, 0)
      Curses.addstr(msg)
      Curses.refresh
      sleep 0.1
    end
  end
end


