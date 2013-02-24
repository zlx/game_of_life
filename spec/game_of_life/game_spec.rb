require 'spec_helper'

def test_grid(init_grid, expected_grid)
  GameOfLife.new(init_grid).tick.should == expected_grid
end

describe GameOfLife do

  context "x axis" do
    it "1 cells" do
      test_grid [[0]], [[0]]

      test_grid [[1]], [[0]]
    end

    it "2 cells" do
      test_grid [[0, 0]], [[0, 0]]

      test_grid [[0, 1]], [[0, 0]]

      test_grid [[1, 1]], [[0, 0]]
    end

    context "3 cells" do

      it "all dead" do
        test_grid [[0, 0, 0]], [[0, 0, 0]]

        test_grid [[0, 0, 1]], [[0, 0, 0]]

        test_grid [[0, 1, 1]], [[0, 0, 0]]
      end

      it "keep alive" do
        test_grid [[1, 1, 1]], [[0, 1, 0]]
      end
    end

    context "4 cells" do
      it "all dead" do
        test_grid [[0, 0, 0, 0]], [[0, 0, 0, 0]]

        test_grid [[0, 0, 0, 1]], [[0, 0, 0, 0]]

        test_grid [[0, 0, 1, 1]], [[0, 0, 0, 0]]

        test_grid [[1, 0, 1, 1]], [[0, 0, 0, 0]]
      end

      it "keep alive" do
        test_grid [[0, 1, 1, 1]], [[0, 0, 1, 0]]

        test_grid [[1, 1, 1, 0]], [[0, 1, 0, 0]]

        test_grid [[1, 1, 1, 1]], [[0, 1, 1, 0]]
      end
    end
  end

  context "y axis" do

    it "2 cells" do
      test_grid [[0], [0]], [[0], [0]]

      test_grid [[0], [1]], [[0], [0]]

      test_grid [[1], [1]], [[0], [0]]
    end

    context "3 cells" do
      it "all dead" do
        test_grid [[0], [0], [0]], [[0], [0], [0]]

        test_grid [[0], [0], [1]], [[0], [0], [0]]

        test_grid [[0], [1], [1]], [[0], [0], [0]]
      end

      it "keep alive" do
        test_grid [[1], [1], [1]], [[0], [1], [0]]

      end

    end

    context "4 cells" do
      it "all dead" do
        test_grid [[0], [0], [0], [0]], [[0], [0], [0], [0]]

        test_grid [[0], [0], [0], [1]], [[0], [0], [0], [0]]

        test_grid [[0], [0], [1], [1]], [[0], [0], [0], [0]]

        test_grid [[1], [0], [1], [1]], [[0], [0], [0], [0]]
      end

      it "keep alive" do
        test_grid [[0], [1], [1], [1]], [[0], [0], [1], [0]]

        test_grid [[1], [1], [1], [0]], [[0], [1], [0], [0]]

        test_grid [[1], [1], [1], [1]], [[0], [1], [1], [0]]
      end
    end
  end

  context "2x2 cells" do
    it "all dead" do
      #test_grid [[0, 0], [0, 0]], [[0, 0], [0, 0]]

    end

  end
end
