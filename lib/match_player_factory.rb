module DominoMofo

  class MatchPlayerFactory
   attr_reader :match
    
    def initialize match
      @match = match
      add_player_group_to_match
    end
    
    private     

    def add_player_group_to_match
      player_group = PlayerGroup.new
      add_human_players(player_group)
      add_computer_players(player_group)
      @match.players = player_group
    end
    
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