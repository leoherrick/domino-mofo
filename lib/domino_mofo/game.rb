module DominoMofo
  
  class Game
    
    attr_reader :players, :boneyard, :scorecard, :line, :whose_turn
    attr_writer :whose_turn
    
    def initialize
      @players = []
      @boneyard = create_boneyard
      @line = nil
      @whose_turn = nil
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
    
    def set_players number
      number.times do |n|
        @players << Player.new(n+1)
      end
    end

    def create_boneyard
      @boneyard = Boneyard.new
    end
    
    def distribute_bones
      @players.each{|player| player.hand = @boneyard.draw_seven_dominos}
    end
    
    def create_scorecard
      @scorecard = DominoMofo::Scorecard.new(@players.length)
    end
    
    def get_first_player
      @players.each do |player|
        [6,5,4,3,2,1,0].each do |suit|
          if player.hand.detect{|x| x.is_of_suit("doubles") && x.return_a_side_matching(suit)}
            @whose_turn = player
            return player
          end          
        end
      end
    end
    
    def get_next_player current_player
      cpn = current_player.number
      unless cpn == @players.length
        @players.find{|player| player.number == cpn+1}
      else 
        @players[0]
      end
    end
    
    def play_first_domino domino 
      @line = Line.new(domino)
    end
    
    def play(domino, suit)
      @line.add_domino(domino, suit)
    end
    
    def get_points_on_the_board
      result = 0
      @line.unconnected_sides.each do |x|
        result += x
      end
      result
    end
    
    def advance_turn
      @whose_turn = next_player(whose_turn)
    end
    
  end
end