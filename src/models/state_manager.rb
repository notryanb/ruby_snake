module GameState
  class Manager
    attr_accessor :current_state, :next_state

    def initialize
      @current_state = GameState::Menu.new
      @state_name = @current_state.name
    end

    def next_state
      return GameState::Play.new(30, 30) if @state_name == :menu
      exit(true) if @state_name == :play
    end
  end
end
