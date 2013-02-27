class GameOfLife
  def initialize(init_grid)
    @init_grid = init_grid
    @y_length = @init_grid.size
    @x_length = @init_grid[0].size
  end

  def tick
    @grid = @y_length.times.map { [0] * @x_length}

    @y_length.times.each_with_index do |j|
      @x_length.times.each_with_index do |i|
        if alive?(i, j) && has_2_or_3_neighbor_alive?(i, j)
          set_alive(i, j)
        end

        if !alive?(i, j) && has_3_neighbor_alive?(i, j)
          set_alive(i, j)
        end
      end
    end

    @grid
  end

  private

  def alive?(i, j)
    @init_grid[j][i] == 1
  end

  def has_2_or_3_neighbor_alive?(i, j)
    count = neighbor_alive_count(i, j)
    2 == count || 3 == count
  end

  def has_3_neighbor_alive?(i, j)
    3 == neighbor_alive_count(i, j)
  end

  def neighbor_alive_count(i, j)
    count = 0
    count += 1 if up_alive?(i, j)
    count += 1 if down_alive?(i, j)
    count += 1 if left_alive?(i, j)
    count += 1 if right_alive?(i, j)
    count += 1 if left_down_alive?(i, j)
    count += 1 if right_up_alive?(i, j)
    count += 1 if right_down_alive?(i, j)
    count += 1 if left_up_alive?(i, j)

    count
  end

  def set_alive(i, j)
    @grid[j][i] = 1
  end

  def up_alive?(i, j)
    j > 0 && @init_grid[j-1][i] == 1
  end

  def down_alive?(i, j)
    j < @y_length-1 && @init_grid[j+1][i] == 1
  end

  def left_alive?(i, j)
    i > 0 && @init_grid[j][i-1] == 1
  end

  def right_alive?(i, j)
    i < @x_length && @init_grid[j][i+1] == 1
  end

  def left_down_alive?(i, j)
    i > 0 && j < @y_length-1 && @init_grid[j+1][i-1] == 1
  end

  def right_up_alive?(i, j)
    i < @x_length-1 && j > 0 && @init_grid[j-1][i+1] == 1
  end

  def right_down_alive?(i, j)
    i < @x_length-1 && j < @y_length-1 && @init_grid[j+1][i+1] == 1
  end

  def left_up_alive?(i, j)
    i > 0 && j > 0 && @init_grid[j-1][i-1] == 1
  end
end
