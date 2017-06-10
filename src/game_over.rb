module GameState
  class GameOver
    attr_reader :name, :completed

    def initialize
      @completed = false
      @name = :game_over
    end

    def run
      puts "*" * 1000
      Curses.clear
      
      msg = 'Thanks for Playing!'
      Curses.setpos(0, 0)
      Curses.addstr(msg)
      Curses.refresh
      sleep 0.1
      # exit(1)
    end
  end
end

