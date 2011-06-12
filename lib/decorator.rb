module Decorator
  def self.red_background(text); "\033[41;37m" + text + "\033[0m\n"; end
  def self.blue_background(text); "\e[44;37m" + text + "\e[0m\n"; end
end