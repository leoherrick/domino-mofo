module Radbones
  class Game
    
    attr_reader :players, :boneyard
    
    def initialize(output)
      @output = output
      @players = []
      @boneyard = []
    end
    
    def welcome
      @output.puts "Yo Yo Yo! Hope you're ready to throw some bones... playa!"
    end

    def ask_for_opponents
      @output.puts "How many people do you wanna to play? You can play up to 3"
    end

    def ask_for_houses
      @output.puts "And how many houses are you up for? Three, Four, or Five?"
    end
    
    def opponents= opponents
      if ["1","2","3"].include?(opponents) 
        @opponents = opponents.to_i
        @output.puts "A'ight. Dem's "+ opponents + " baaad men you brought with ya."
        return true
      else
        @output.puts "Speak English?!! Uno, Dos, or Tres people dude?"
        return false
      end
    end
    
    def houses= houses
      if ["3","4", "5"].include?(houses) 
        @houses = houses.to_i
        @output.puts "A'ight. First to " + houses + " houses then. Better bring it."
        return true
      else
        @output.puts "Read man. Read! Three, Four, or Five?"
        return false
      end
    end
    
    def add_players number
      number.times do 
        @players << Player.new
      end
    end

    def create_boneyard
      @boneyard = Boneyard.new
    end
    
    def distribute_bones
      @players.each{|player| player.hand = @boneyard.draw(7)}
    end
  end
end