class Player

  attr_reader :board, :direction, :answer

  def initialize
    @board = Board.new
  end

  # process data for each event from tetris-server
  def process(data)
    @board.update_state(prepare_data(data))
  end

  # This method should return string like left=0, right=0, rotate=0, drop'
  def step
    @board.print
    move("right")
  end

  # This method is used for processing event from tetris-server to params for client
  def prepare_data(data)
    raise 'No data to prepare params' unless data
    data.sub(/board=/,'')
  end

  def move(direction)
    "#{direction}=1"
  end
end
