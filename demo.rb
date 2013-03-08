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
  erb :index#, :locals => {:grid => grid}
end

post '/' do
  #p 1, params[:grid]
  before_grid = params[:grid].each{|k, v| v.map!(&:to_i)}
  #p 2, before_grid
  after_grid = before_grid.keys.size.times.map{ [0]*before_grid["0"].size}
  #p 3, after_grid
  before_grid.each{|j, v| v.each_with_index{|x, i| after_grid[j.to_i][i] = 1 if x == 1}}
  #p 4, after_grid
  GameOfLife.new(after_grid).tick.flatten.join
end
