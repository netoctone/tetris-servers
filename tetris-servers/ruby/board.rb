# encoding: utf-8
# 
# ☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼
# ☼*************☼
# ☼*************☼
# ☼*************☼
# ☼*************☼
# ☼*************☼
# ☼*************☼
# ☼*************☼
# ☼*************☼
# ☼*************☼
# ☼*************☼
# ☼*************☼
# ☼* 1111332111☺☼
# ☼*************☼
# ☼☼☼☼☼☼☼☼☼☼☼☼☼☼☼
#

class Board
  MAP = {'☺' => '@', '☼' => 'x', 'Ѡ' => '@' }

  attr_reader :state, :size, :position

  def update_state(data)
    @size = Math.sqrt(data.size).to_i unless @size
    @state = prepare_board_data(data)
  end

  # prepare board data
  def prepare_board_data(data)
    re = Regexp.new(MAP.keys.map { |x| Regexp.escape(x) }.join('|'))
    data = data.gsub(re, MAP)
    res = []
    data.split('').each_slice(@size) { |e| res << e }
    res
  end

  # printing board state to output
  def print
    puts "\n"
    @state.each { |r| puts r.join.gsub(' ', '_').to_s } 
  end

  def position
    row = @state.flatten.index('@')/@size
    col = @state[row].index('@')
    [row,col]
  end

  def area
    row, col = position
      [
        @state[row-1][col-1], @state[row-1][col], @state[row-1][col+1],
        @state[row][col-1],   @state[row][col],   @state[row][col+1],
        @state[row+1][col-1], @state[row+1][col], @state[row+1][ col]
      ]
  end

end
