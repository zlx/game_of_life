class GameOfLife
  def initialize(init_grid)
    @init_grid = init_grid
    @x_length = @init_grid.size
  end

  def tick
    @grid = Array.new(@init_grid.size) { 0 }

    (1..@x_length).each do |i|
      if alive?(i) && has_2_neighbor_alive?(i)
        set_alive(i)
      end
    end

    @grid
  end

  def alive?(x)
    @init_grid[x] == 1
  end

  def has_2_neighbor_alive?(x)
    @x_length >= 3 && @init_grid[x-1] == 1 && @init_grid[x+1] == 1
  end

  def set_alive(x)
    @grid[x] = 1
  end
end
