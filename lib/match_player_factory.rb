module DominoMofo

  class MatchPlayerFactory
   attr_reader :match
    
    def initialize match
      @match = match
    end
    
    def create_player_group
      player_group = PlayerGroup.new
      add_human_players(player_group)
      add_computer_players(player_group)
      player_group
    end
    
    private     
    
    def add_human_players player_group
      player_group << HumanPlayer.new(@match)      
    end
    
    def add_computer_players player_group
      number_of_cpu_players = @match.number_of_players - 1
      number_of_cpu_players.times do
        player_group << ComputerPlayer.new(@match)
      end
    end
    
  end
  
end