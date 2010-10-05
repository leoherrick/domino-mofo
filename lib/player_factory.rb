module DominoMofo
  
  class PlayerFactory
        
    def create_player_group(number_of_players)
      player_group = PlayerGroup.new
      player_group << HumanPlayer.new
      human_player = 1
      (number_of_players - human_player).times do 
        player_group << ComputerPlayer.new
      end
      
      return player_group
    end
    
  end
  
end