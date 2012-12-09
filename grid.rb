require_relative 'cell'

class Grid
  
  def initialize(cols, rows)
    @cols = cols
    @rows = rows
    @cells = {}
    create_cells
  end

  def cell_at(x,y)
    @cells[x][y] if @cells[x]
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
    _neighbors = []
    _neighbors << cell_at(x-1,y-1)
    _neighbors << cell_at(x-1,y)
    _neighbors << cell_at(x-1,y+1)
    _neighbors << cell_at(x,y-1)
    _neighbors << cell_at(x,y+1)
    _neighbors << cell_at(x+1,y-1)
    _neighbors << cell_at(x+1,y)
    _neighbors << cell_at(x+1,y+1)
    _neighbors.compact
  end
  
  def live_neighbors_for(x,y)
    neighbors_for(x,y).select {|neighbor| neighbor.alive?}
  end
  
  
  # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
  # Any live cell with two or three live neighbours lives on to the next generation.
  # Any live cell with more than three live neighbours dies, as if by overcrowding.
  # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
  def evaluate_next_generation_for(cell)
    live_neighbors = live_neighbors_for(cell.x,cell.y)
    if(cell.alive?)
      cell.next_generation = false if live_neighbors.size < 2 or live_neighbors.size > 3
      cell.next_generation = true if [2,3].include? live_neighbors.size
    else
      cell.next_generation = true if live_neighbors.size == 3
    end
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
