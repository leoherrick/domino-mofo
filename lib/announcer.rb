module DominoMofo
  
  class Announcer < Array
    
    def initialize output
      @output = output
    end
    
    def welcome
      @output.puts("Hope you ready to throw some bones playa! Let's do this!")
    end
    
    def ask_for_opponents
      @output.puts("How many playas you wanna to play dawg? One, two, or tre?")
    end
    
    def ask_for_houses
      @output.puts("And how many houses you down for? Three, Four, or Five?")
    end

    def say_game_is_ready
      @output.puts("A'ight Playa. Let's do this thing.")
    end
    
    def tell_user_to_lead_with_highest_pair
      @output.puts("Looks like you've got the highest double. Go ahead and lead-out dawg!")
    end    
    
    def please_play_double
      @output.puts("You have the highest double. Please lead out with your highest double.")
    end    
    
    def cpu_has_highest_double
      @output.puts("The computer has the highest double.")
    end

    def cpu_has_made_move
      @output.puts("The computer just made a play.")
    end

    def tell_player_it_is_their_turn
      @output.puts("It's your turn, please make a play.")
    end
  
  end
end