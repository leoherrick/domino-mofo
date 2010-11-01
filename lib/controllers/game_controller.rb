module DominoMofo
  
  class GameController
    attr_accessor :queue

    def initialize game
      @game = game
      @queue = Queue.new
      move_game_players_into_queue
    end

    def deal_dominoes
      @game.players.each do |player|
        player.hand.replace @game.boneyard.draw_seven
      end
    end

    def start_game
      if @game.first_game?
        shift_queue_to_player_with_highest_pair
        play_or_request_highest_domino
      end
    end
    
    def make_cpu_moves
      if player_at_turn.computer_player?
        player_at_turn.make_best_play
        announcer.cpu_has_made_move
        make_cpu_moves
      else
        announcer.tell_player_it_is_their_turn
      end
    end
    
    def player_at_turn
      @queue.first
    end
    
    private
    
    def play_or_request_highest_domino
      if player_with_highest_pair.human_player?
        announcer.please_play_double
      else
        announcer.cpu_has_highest_double
        player_at_turn.lead_out(player_at_turn.hand.find_domino_with_suits(6,6))
        announcer.cpu_has_made_move
      end
    end
    
    def shift_queue_to_player_with_highest_pair
      @queue.shift_to_player!(player_with_highest_pair)
    end
    
    def player_with_highest_pair
      @game.players.find_player_with_highest_pair
    end
    
    def move_game_players_into_queue 
      @game.players.each do |player|
        @queue << player
      end
    end
    
    def announcer
      @game.match.controller.announcer
    end    
  end
end
    