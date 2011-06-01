require "spec_helper"

module DominoMofo
  describe Announcer do
    before(:each) do
      @output = double("output")
      @announcer = Announcer.new(@output)
    end    
  end
end