module DominoMofo
  
  class Game
    attr_accessor :board, :boneyard, :queue
    attr_reader :players, :match
    
    def initialize(match)
      @match = match
      @players = @match.players
      @boneyard = Boneyard.new
      @board = Board.new
      deal_dominoes
      create_turn_queue
    end
    
    def first_game?
      @match.dom ? false : true
    end    
    
    def deal_dominoes
      players.each do |player|
        player.hand.replace boneyard.draw_seven
      end
    end

    def start_game
      if first_game?
        shift_queue_to_player_with_highest_pair
        announce_who_has_highest_domino
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
    
    def announce_who_has_highest_domino
      if player_at_turn.human_player?
        announcer.tell_user_to_lead_with_highest_pair
      else
        announcer.cpu_has_highest_double
      end
    end
    
    def player_at_turn
      @queue.first
    end
        
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
      players.find_player_with_highest_pair
    end
    
    def create_turn_queue 
      @queue = TurnQueue.new
      players.each do |player|
        @queue << player
      end
    end
    
    def announcer
      match.announcer
    end
  end
end