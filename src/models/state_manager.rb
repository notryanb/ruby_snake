module GameState
  class Manager
    attr_accessor :current_state, :next_state

    def initialize
      @current_state = GameState::Menu.new
    end

    def next_state
      GameState::Play.new(30, 30)
    end
  end
end
