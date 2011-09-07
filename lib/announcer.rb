class DominoMofo::Announcer
  include DominoMofo
  include Ruport::Data
  
  def welcome
    Screen.clear
    puts "\nReady to throw some bones? Let's do this!"
  end

  def ask_for_opponents
    puts "How many players dawg? One, two, or three?"
  end

  def ask_for_houses
    puts "And how many houses? Three, Four, or Five?"
  end

  def say_game_is_ready
    puts "A'ight. Let's do this."
  end

  def tell_user_to_lead_with_highest_pair
    puts "Looks like you've got the highest double. Lead-out dawg!"
  end    

  def please_play_double
    puts "You have the highest double. Please lead out with your highest double."
  end    

  def cpu_has_highest_double
    puts "The computer has the highest double."
  end

  def tell_player_it_is_their_turn( board, player_at_turn )    
    puts "\nBoard:"
    ruport = Table.new :column_names => %w[# domino opens]
    board.each_with_index do |d, i|
      opens = d.open? ? d.find_all_open_ends.collect{|x| x.suit}.join(",") : ''
      ruport <<  [i, "[#{d.suit_of_end1}|#{d.suit_of_end2}]", opens]
    end
    print ruport if board.length > 0
    
    puts "\nHand:"
    ruport = Table.new :column_names => %w[# domino]
    player_at_turn.hand.each_with_index do |d, i|
      ruport <<  [i, "[#{d.suit_of_end1}|#{d.suit_of_end2}]"]
    end
    print ruport
    
    puts "\nIt's your turn, please make a play."
    
  end      
end
