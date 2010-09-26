module DominoMofo
  
  class GameController
    
    attr_reader :opponents, :houses
    
    def initialize output
      @output = output
      @game = nil
      @opening_input = {:players => nil, :houses => nil}
    end
    
    def say_welcome
      @output.puts "Yo Yo Yo! Hope you're ready to throw some bones playa! LET'S DO DIS!"
    end

    def ask_for_opponents
      @output.puts "How many playas you wanna to play dawg? One, two, or tre?"
    end  
    
    def try_setting_opponents opponents
      if is_valid_number_of_opponents(opponents) 
        @opponents = opponents
        give_opponents_success_message
      else
        ask_for_opponents_again
      end
    end

    def ask_for_houses
      @output.puts "And how many houses you down for? Three, Four, or Five?"
    end

    def try_setting_houses houses
      if is_valid_number_of_houses(houses) 
        @houses = houses
        give_houses_success_message
      else
        ask_for_houses_again
      end
    end
    
      def is_valid_number_of_opponents number_of_opponents
        [1,2,3].include?(number_of_opponents.to_i) ? true : false
      end
    
      def ask_for_opponents_again
        @output.puts "Speak English?!! Uno, Dos, or Tres people dude?"
      end

      def give_opponents_success_message
        @output.puts "A'ight. Dem's some baaad men you brought with ya."
      end

      def is_valid_number_of_houses number_of_houses
        [3,4,5].include?(number_of_houses.to_i) ? true : false      
      end

      def ask_for_houses_again
        @output.puts "Read man. Read! Three, Four, or Five?"
      end

      def give_houses_success_message
        @output.puts "A'ight. First to 3 houses then. Better bring it."
      end
    
  end
end