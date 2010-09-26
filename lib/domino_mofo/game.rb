module DominoMofo
  
  class Game
    
    attr_reader :players, :boneyard, :scorecard, :line, :whose_turn, :houses
    attr_writer :whose_turn
    
    def initialize
      @players = []
      @boneyard = create_boneyard
      @line = nil
      @whose_turn = nil
    end
    
    def set_players players
      players.times do |n|
        @players << Player.new(n+1)
      end
    end

    def set_houses houses
      @houses = houses
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
          if player.hand.detect{|x| x.is_double && x.return_a_side_matching_suit(suit)}
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
      @line.get_unconnected_sides.each do |x|
        result += x
      end
      result
    end
    
    def advance_turn
      @whose_turn = next_player(whose_turn)
    end
    
  end
end