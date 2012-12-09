require 'test/unit'
require_relative 'grid'

class GridTest < Test::Unit::TestCase

  def setup
    @grid = Grid.new(4,4)
    @grid.setup_seed([{x:1,y:1}, {x:1,y:2},{x:1,y:3}])
  end
  
  
  def test_cells_iterator
    cells = []
    @grid.each_cell {|cell| cells << cell}
    assert_equal(16, cells.size)
  end
  
  
  def test_neighbors
    assert_equal(8, @grid.neighbors_for(1,1).size)
    assert_equal(3, @grid.neighbors_for(0,0).size)
  end
  
  def test_seed
    cell = @grid.cell_at(1,1)
    assert(cell.alive?, "Expected cell to be alive at start")
    cell = @grid.cell_at(0,0)
    assert(!cell.alive?, "Expected cell to be dead at start")
  end
  
  def test_next_tick
    @grid.setup_next_state
    cell = @grid.cell_at(0,2)
    assert(cell.alive?, "Expected cell to be alive on the next tick")
  end
  
  
end
