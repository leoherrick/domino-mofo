module DominoMofo
  class Game
    include Observable
    attr_accessor :board, :boneyard, :queue, :plays, :play_announcer
    attr_reader :players, :match
    
    def initialize(match)
      @match = match
      @players = @match.players
      @boneyard = Boneyard.new
      @board = Board.new
      @plays = Array.new
      @status = 'in_progress'
      @knock_streak = 0
      deal_dominoes
      create_turn_queue
      @play_announcer = PlayAnnouncer.new(STDOUT)
    end
    
    def update (play)
      if play.is_a?(Knock)
        @knock_streak += 1
        if @knock_streak == @players.length
          @status = 'game_complete'
          puts "\n\n ********* The Game Has Been Locked Out !!! *********\n\n"          
        end
      elsif play.is_a?(WinningPlay)
        @status = 'game_complete'
        puts "\n\n ********* #{play.player.name} just won !!! *********\n\n"
        match.add_score_to_player_by_name(end_of_game_points, play.player.name)
        puts "\n\n ********* #{play.player.name} just got #{end_of_game_points} !!! *********\n\n"
      else 
        @knock_streak = 0
      end
    end
    
    def lockout
      
    end
    
    def over?
      @status  == 'game_complete'
    end

    def end_of_game_points
      loose_bones_score = 0
      players.each do |p|
        p.hand.each do |d|
          loose_bones_score += d.final_value
        end
      end
      loose_bones_score
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
    
    def make_first_move
      if player_at_turn.computer_player?
        player_at_turn.make_best_play
      else
        announcer.tell_player_it_is_their_turn(@board, player_at_turn)
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
      @queue = TurnQueue.new(@players)
    end
    
    def announcer
      match.announcer
    end
  end
end
