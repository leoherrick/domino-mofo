module DominoMofo
  
  class Announcer < Array
    
    def update ( play )
      if  play.domino == "knocked"
        puts "#{play.player.name} just KNOCKED"
      else 
        puts "#{play.player.name} just played the [#{play.domino.suit_of_end1}|#{play.domino.suit_of_end2}]"
      end
    end
    
    def initialize output
      @output = output
    end
    
    def welcome
      @output.puts("\nHope you ready to throw some bones playa! Let's do this!")
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
      @output.puts("\nThe computer has the highest double.")
    end

    def tell_player_it_is_their_turn( board, player_at_turn )
      @output.puts("\nIt's your turn, please make a play.")
      
      @output.puts "\nBoard:"
      board.each_with_index do |d, i|
        opens = d.open? ? 'opens: ' +  d.find_all_open_ends.collect{|x| x.suit}.join(",") : ''
        @output.puts "(#{i}) [#{d.suit_of_end1}|#{d.suit_of_end2}] #{opens}"
      end
      @output.puts "\nHand:"
      player_at_turn.hand.each_with_index do |d, i|
        @output.puts "(#{i}) [#{d.suit_of_end1}|#{d.suit_of_end2}]"
      end
      
    end
      
  end
end