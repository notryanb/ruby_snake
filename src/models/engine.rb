class Engine
# Game Engine runs the main loop and transitions state
# It is reponsible for getting the current state and moving
# into the next state when the current one is done.

  class << self
    def call
      new(GameState::Manager.new).start
    end
  end

  def initialize(manager)
    @manager = manager
    @current_state = @manager.current_state
  end

  def start
    loop do
      check_state
      @current_state.run
    end
  end

  def check_state
    return unless @current_state.completed
    @manager.transition_state
    @current_state = @manager.current_state
  end
end
