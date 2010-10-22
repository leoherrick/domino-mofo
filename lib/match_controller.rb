module DominoMofo
  
  class MatchController
        
    @output
    @match
    @players
    @houses
    attr_writer :players, :houses
    attr_reader :players, :houses, :match
    
    def initialize output
      @players = 4
      @houses = 3
      @output = output
    end
    
    def welcome
      @output.puts "Yo Yo Yo! Hope you're ready to throw some bones playa! LET'S DO DIS!"
    end
     
    def ask_for_opponents
      @output.puts "How many playas you wanna to play dawg? One, two, or tre?"
    end
    
    def set_players_from_opponents opponents
      self.players = (opponents.to_i + 1)
    end
    
    def ask_for_houses
      @output.puts "And how many houses you down for? Three, Four, or Five?"
    end
    
    def start_match
      @match = Match.new(@players, @houses)
    end
    
    def say_game_is_ready
      @output.puts "A'ight Playa. Let's do this thing."
    end
    
    def tell_user_to_lead_with_highest_pair
      @output.puts "Looks like you've got the highest double. Go ahead and lead-out dawg!"
    end
    
    def return_player_with_highest_pair
      players = @match.active_game.players
      suit = 6 # start with six
      player_has_been_found = false
      until player_has_been_found
        players.each do |player|
          if player.hand.has_domino_with_both_ends?(suit, suit) 
            return player
            player_has_been_found = true
          end
        end
        suit = suit - 1
      end
    end
                
  end
  
end