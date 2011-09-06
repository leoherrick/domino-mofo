class DominoMofo::HumanPlayer < DominoMofo::Player    
  include DominoMofo

  def update
    board = match.current_game.board
    queue = match.current_game.queue
    announcer = match.announcer
    if board.length > 0 && queue.first === self
      announcer.tell_player_it_is_their_turn(board, self)
    end
  end


end