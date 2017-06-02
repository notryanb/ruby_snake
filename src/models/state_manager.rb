module GameState
  class Manager
    attr_accessor :current_state, :next_state

    def initialize
      @current_state = GameState::Menu.new
      @state_name = @current_state.name
    end

    def next_state
      case @state_name
      when :menu
        return GameState::Play.new(30, 30)
      when :play
        return GameState::GameOver.new
      else
        exit(1)
      end
    end
  end
end
