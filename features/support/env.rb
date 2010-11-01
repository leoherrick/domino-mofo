$LOAD_PATH << File.expand_path('../../../lib', __FILE__) 
require 'domino_mofo'
require 'spec/spec_helper.rb'
include SpecHelper

class Output
  def messages 
    @messages ||= [] 
  end 
  def puts(message) 
    messages << message 
  end 
end 
def output 
  @output ||= Output.new 
end 