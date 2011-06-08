module DominoMofo
  
  class Match

    attr_reader :scorecard, :number_of_players, :number_of_houses, :controller, :announcer
    attr_accessor :current_game, :players, :dom
    
    def update ( game )
      @current_game = Game.new(self)
      @current_game.make_first_move      
    end
    
    def initialize(number_of_players = 4, number_of_houses = 3)
      @number_of_players = number_of_players
      @number_of_houses = number_of_houses
      @players = create_player_group
      @scorecard = Scorecard.new(@players)
      @current_game = Game.new(self)
      @dom = nil
      @announcer = Announcer.new(STDOUT)
    end
    
    def add_score_to_player_by_name(score, player_name)
      @scorecard.add_score_to_player_by_name(score, player_name)
    end
    
    def create_player_group
      players = PlayerGroup.new
      add_human_players(players)
      add_computer_players(players)
      return players
    end
    
    def start_match
      @announcer.welcome
      @current_game.start_game
    end

    def change_output output
      @announcer = Announcer.new(output)
    end
    
    def current_player
      @current_game.queue[0]
    end
        
    private     
    
    def add_human_players player_group
      human_player = HumanPlayer.new(self, "Human")
      player_group << human_player
    end
    
    def add_computer_players player_group
      number_of_cpu_players = number_of_players - 1
      number_of_cpu_players.times do |i|
        cpu_player = ComputerPlayer.new(self, "cpu_"+i.to_s)
        player_group << cpu_player
      end
    end      
  end
end