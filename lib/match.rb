module DominoMofo
  
  class Match

    attr_reader :scorecard, :number_of_players, :number_of_houses, :controller, :announcer
    attr_accessor :current_game, :players, :dom
    
    def initialize(number_of_players = 4, number_of_houses = 3)
      @number_of_players = number_of_players
      @number_of_houses = number_of_houses
      create_player_group
      @scorecard = Scorecard.new(self)
      @current_game = Game.new(self)
      @dom = nil
      @announcer = Announcer.new(STDOUT)
    end
    
    def create_player_group
      @players = PlayerGroup.new
      add_human_players(@players)
      add_computer_players(@players)
    end
    
    def start_match
      @announcer.welcome
      @current_game.start_game
    end

    def change_output output
      @announcer = Announcer.new(output)
    end
        
    private     
    
    def add_human_players player_group
      player_group << HumanPlayer.new(self)      
    end
    
    def add_computer_players player_group
      number_of_cpu_players = number_of_players - 1
      number_of_cpu_players.times do
        player_group << ComputerPlayer.new(self)
      end
    end
    
  end
end