class Engine
  class << self
    def call
      new(GameState::Manager.new).start
    end
  end

  def initialize(manager)
    @current_state = manager.current_state
    @next_state = manager.next_state
  end

  def start
    loop do
      @current_state.run
      @current_state = @next_state if @current_state.completed
    end
  end
end

# Game Engine runs the main loop and transitions state
# It is reponsible for getting the current state and moving
# into the next state when the current one is done.
