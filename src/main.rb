require 'curses'
require 'yaml'

$LOAD_PATH.unshift '.'

require 'models/cell'
require 'models/player'
require 'models/food'
require 'models/game_board'
require 'models/rules'
require 'models/snake'

def main
  Curses.init_screen
  Curses.noecho
  Curses.cbreak
  Curses.timeout=0
  Curses.curs_set 0
  Snake.new(30,30).play
ensure
  Curses.close_screen
end

main
