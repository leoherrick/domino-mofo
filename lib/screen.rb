module DominoMofo::Screen
  include DominoMofo
  def self.clear
    print "\e[2J\e[f"
  end
 
 def self.print_all
   self.print_announcements
   self.print_last_moves
   self.print_hand
   self.print_other_players
   self.print_board
 end

end
   