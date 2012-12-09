require_relative 'cell'

class Grid
  
  def initialize(cols, rows)
    @cols = cols
    @rows = rows
    @cells = {}
    create_cells
  end

  def cell_at(x,y)
    @cells[x][y]
  end

  def create_cells
    (0..@cols-1).each do |x|
      @cells[x] = {}
      (0..@rows-1).each do |y|
        @cells[x][y] = Cell.new(x, y)
      end
    end
  end
  
  def setup_seed(seed)
    seed.each do |coord|
      cell_at(coord[:x], coord[:y]).alive = true
    end
  end
  
  def neighbors_for(x,y)
    
  end
  
  def setup_next_state
    each_cell {|cell| evaluate_next_generation_for(cell)}
    each_cell {|cell| cell.alive = cell.next_generation}
  end
  
  def each_cell
    @cells.each do |col, rows|
      rows.each do |row, cell|
        yield cell
      end
    end
  end


end
