require "spec_helper"

module DominoMofo
  
  describe Player do 
    before(:each) do
<<<<<<< HEAD:spec/player_spec.rb
      @game = Game.new
      @player = Player.new(@game)
=======
      @match = Match.new
      @player = Player.new(@match)
>>>>>>> d3463ed586bf1ff199d80c9eaa741b47f57eee4b:spec/player_spec.rb
    end

    it "should have a hand (of dominoes)" do
      @player.hand.should be_true
    end      
    
    it "should belong to a match" do
        @player.match.should be_true
    end
    
<<<<<<< HEAD:spec/player_spec.rb
    it "should know if it's human" do
      HumanPlayer.new(@game).should be_human_player
=======
    it "should know if it's in instance of the 'Human' class" do
      human_player = HumanPlayer.new(@match) #subclass of Player
      human_player.should be_human_player
>>>>>>> d3463ed586bf1ff199d80c9eaa741b47f57eee4b:spec/player_spec.rb
    end

<<<<<<< HEAD:spec/player_spec.rb
    it "should know if it's a computer controlled player" do
      ComputerPlayer.new(@game).should be_computer_player
=======
    it "should know if it's in instance of the 'Computer' class" do
      computer_player = ComputerPlayer.new(@match) #subclass of Player
      computer_player.should be_computer_player
    end
    
    it "should be able to lead with given domino" do
      @player = Player.new(@match)
      hand = @player.hand << Domino.new(6,6)

      expect {
        @player.lead_with_domino(6,6)
      }.to change {
        @player.hand.length
      }.from(1).to(0)
>>>>>>> d3463ed586bf1ff199d80c9eaa741b47f57eee4b:spec/player_spec.rb
    end
        
  end
end
