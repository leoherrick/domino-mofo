module DominoMofo
  
  class GameController
        
    attr_reader :opening_game_details, :game
    attr_writer :game
        
    def initialize output
      @output = output
      @game = nil
      @opening_game_details = {:players => nil, :houses => nil}
    end
    
    def say_welcome
      @output.puts "Yo Yo Yo! Hope you're ready to throw some bones playa! LET'S DO DIS!"
    end

    def ask_for_opponents
      @output.puts "How many playas you wanna to play dawg? One, two, or tre?"
    end  
    
    def try_setting_opponents opponents
      if is_valid_number_of_opponents(opponents) 
        @opening_game_details[:players] = opponents+1
        give_opponents_success_message
      else
        ask_for_opponents_again
      end
    end

    def get_players 
      @opening_game_details[:players]
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

    def ask_for_houses
      @output.puts "And how many houses you down for? Three, Four, or Five?"
    end

    def try_setting_houses houses
      if is_valid_number_of_houses(houses) 
        @opening_game_details[:houses] = houses
        give_houses_success_message
      else
        ask_for_houses_again
      end
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
  
     def get_houses
      @opening_game_details[:houses]
    end
    
    def start_game
      game = Game.new
      game.set_players(get_players)
      game.set_houses(get_houses)
      @game = game
    end
  end
end