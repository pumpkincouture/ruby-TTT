class Board
  attr_accessor :cells

  def initialize(size)
    @size = size
    @cells = Array.new(size * size, []);
  end

  def place_move(space, marker)
    move = convert_move(space)
    cells[move] = marker
  end

  def occupied_spaces
    cells.select { |cell| !cell.empty? }
  end

  def open_spaces
    cells.select { |cell| cell.empty? }
  end

  def full?
    open_spaces.length <= 0
  end

  def clear_cell(cells, move)
    cells[move] = []
  end

  private

  def convert_move(chosen_space)
    chosen_space.to_i - 1
  end

end
