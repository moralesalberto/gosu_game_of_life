require_relative 'grid'

class Window < Gosu::Window

  def initialize(cols, rows, seed={}) #seed is array of hashes of coords of live cells [{x:4, y:4}, {x:3, y:7}, etc.]
    @image_width = 20
    @image_height = 20
    @cols = cols
    @rows = rows
    
    super(@image_width*@cols, @image_height*@rows, false)
    @grid = Grid.new(@cols, @rows)

    @image_on = Gosu::Image.new(self, 'image_on.png', false)
    @image_off = Gosu::Image.new(self, 'image_off.png', false)
    
    @grid.setup_seed(seed)
  end

  def setup
    @grid.setup_next_state
  end

  def draw
    @grid.each_cell do |cell|
      if cell.alive?
        @image_on.draw(cell.x*@image_width, cell.y*@image_height, 0)
      end
    end
  end
  
end
