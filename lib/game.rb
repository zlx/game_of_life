class GameOfLife
  def initialize(init_grid)
    @init_grid = init_grid
    @y_length = @init_grid.size
    @x_length = @init_grid[0].size
  end

  def tick
    if @y_length == 1
      @grid = [Array.new(@x_length) { 0 }]
    else
      @grid = Array.new(@y_length) { [0] }
    end

    if @y_length == 1
      (1..@x_length).each do |i|
        if alive_x?(i) && has_2_x_neighbor_alive?(i)
          set_alive_x(i)
        end
      end
    else
      (1...@y_length-1).each do |j|
        if alive_y?(j) && has_2_y_neighbor_alive?(j)
          set_alive_y(j)
        end
      end
    end

    @grid
  end

  def alive_y?(j)
    @init_grid[j][0] == 1
  end

  def has_2_y_neighbor_alive?(j)
    @y_length >= 3 && @init_grid[j-1][0] == 1 && @init_grid[j+1][0] == 1
  end

  def set_alive_y(j)
    @grid[j][0] = 1
  end

  def alive_x?(x)
    @init_grid[0][x] == 1
  end

  def has_2_x_neighbor_alive?(x)
    @x_length >= 3 && @init_grid[0][x-1] == 1 && @init_grid[0][x+1] == 1
  end

  def set_alive_x(x)
    @grid[0][x] = 1
  end

end
