module GameState
  class GameOver
    attr_accessor :completed
    attr_reader :name

    def initialize
      @completed = false
      @name = :game_over
    end

    def run
      msg = 'Thanks for Playing!'
      Curses.setpos(0, 0)
      Curses.addstr(msg)

    end
  end
end

