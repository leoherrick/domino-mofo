#module DominoMofo
#  
#  class GameController
#        
#    attr_reader :opening_game_details, :game
#    attr_writer :game
#        
#    def initialize output
#      @output = output
#      @game = nil
#      @opening_game_details = {:players => 4, :houses => 3}
#    end
#        
#    def try_setting_opponents opponents
#      if is_valid_number_of_opponents(opponents) 
#        @opening_game_details[:players] = opponents.to_i+1
#        give_opponents_success_message
#      else
#        ask_for_opponents_again
#      end
#    end
#    
#    def is_valid_number_of_opponents number_of_opponents
#      [1,2,3].include?(number_of_opponents.to_i) ? true : false
#    end
#  
#    def ask_for_opponents_again
#      @output.puts "Speak English?!! Uno, Dos, or Tres people dude?"
#    end
#
#    def give_opponents_success_message
#      @output.puts "A'ight. Dem's some baaad men you brought with ya."
#    end
#
#
#    def try_setting_houses houses
#      if is_valid_number_of_houses(houses) 
#        @opening_game_details[:houses] = houses.to_i  
#        give_houses_success_message
#      else
#        ask_for_houses_again
#      end
#    end
#
#    def is_valid_number_of_houses number_of_houses
#      [3,4,5].include?(number_of_houses.to_i) ? true : false      
#    end
#
#    def ask_for_houses_again
#      @output.puts "Read man. Read! Three, Four, or Five?"
#    end
#
#    def give_houses_success_message
#      @output.puts "A'ight. First to 3 houses then. Better bring it."
#    end
#
#    def get_houses
#      @opening_game_details[:houses]
#    end
#
#    def start_game
#      game = Game.new({:players => get_players})
#      @game = game
#    end
#
#    def say_game_is_ready
#      @output.puts "A'ight Playa. Let's do this thing."
#    end
#  
#  end
#end