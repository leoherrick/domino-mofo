require 'rubygems'
require 'sinatra'
require 'haml'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__) 
require 'lib/domino_mofo' 
include DominoMofo


get '/' do
  match = Match.new(4,2)
  match.start_match
  match.current_game.make_first_move
  @number_of_players = match.number_of_players
  @human_player = match.players.find{|p| p.human_player?}
  @human_hand = @human_player.hand
  @board = match.current_game.board
  @spinner = @board.spinner
  haml :index
end