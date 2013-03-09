require 'rubygems'
require 'sinatra'
require './lib/game'

get '/' do
  @grid = [[1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
           [1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]]
  @grid1 = fetch_default_grid(0)
  @grid2 = fetch_default_grid(1)
  @grid3 = fetch_default_grid(2)
  @grid4 = fetch_default_grid(3)
  @grid5 = fetch_default_grid(4)
  erb :index
end

post '/' do
  before_grid = params[:grid].each{|k, v| v.map!(&:to_i)}
  after_grid = before_grid.keys.size.times.map{ [0]*before_grid["0"].size}
  before_grid.each{|j, v| v.each_with_index{|x, i| after_grid[j.to_i][i] = 1 if x == 1}}
  GameOfLife.new(after_grid).tick.flatten.join
end

private
def fetch_default_grid(i)
  grid = IO.readlines(File.join(File.dirname(__FILE__), "data", "grids"))[i]
  size = Math.sqrt(grid.size).to_i
  m = Array.new(size){|a| Array.new(size)}
  size.times do |y|
    size.times do |x|
      m[y][x] = grid[y*size + x].to_i
    end
  end
  m
end
