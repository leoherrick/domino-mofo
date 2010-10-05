require "spec_helper"

module DominoMofo
  describe PlayerFactory do
    
    before(:each) do
      player_factory = PlayerFactory.new
      @player_group_with_one = player_factory.create_player_group(1)
      @player_group_with_two = player_factory.create_player_group(2)
      @player_group_with_four = player_factory.create_player_group(4)
      @all_three_player_groups = [@player_group_with_one, @player_group_with_two, @player_group_with_four]
    end

    it "should create a player group object" do
      @all_three_player_groups.each do |object| 
        object.class.should equal(PlayerGroup)
      end
    end
    
    it "should create a player group with one and only one human per group" do
      @all_three_player_groups.each do |player_group|
        list_of_humans_in_group = player_group.find_all {|player| player.class == HumanPlayer}
        list_of_humans_in_group.should have_exactly(1).human_player
      end
    end
    
    it "should create player group with all computer players except one" do 
      @player_group_with_one.find_all {|player| player.class == ComputerPlayer}.should have_exactly(0).computer_players
      @player_group_with_two.find_all {|player| player.class == ComputerPlayer}.should have_exactly(1).computer_players
      @player_group_with_four.find_all {|player| player.class == ComputerPlayer}.should have_exactly(3).computer_players
    end
    
  end

  
end