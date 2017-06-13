module GameState
  class Manager
    attr_accessor :current_state

    def initialize
      @current_state = GameState::Menu.new
    end

    def next_state
      if @current_state.name == :menu
        return GameState::Play.new(30, 30)
      end
      if @current_state.name == :play
        return GameState::GameOver.new
      end
    end

    def transition_state
      @current_state = next_state
    end
  end
end
