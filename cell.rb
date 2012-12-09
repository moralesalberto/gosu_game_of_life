class Cell
  attr_reader :x, :y
  attr_accessor :alive, :next_generation
  
  def initialize(x,y)
    @x = x
    @y = y
  end
  
  def alive?
    @alive
  end
  
end
