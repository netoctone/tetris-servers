defmodule Player do
  import Keyword, only: [get: 2]

  def username do 'anatoli' end
  def hostname do '192.168.0.100:8080' end

  def step(msg) do
    keys = Glass.parse(msg)
    { next0, next1, next2, next3 } = list_to_tuple get(keys, :next)
    [row1|_] = get(keys, :glass)
    { b0, b1, b2, b3, b4, b5, b6, b7, b8, b9 } = list_to_tuple row1
    IO.puts """
    x = #{get(keys, :x)}
    y = #{get(keys, :y)}
    figure = #{get(keys, :figure)}
    next = #{next0} #{next1} #{next2} #{next3}
    bottom_row = #{b0}#{b1}#{b2}#{b3}#{b4}#{b5}#{b6}#{b7}#{b8}#{b9}
    """
    'left=1'
  end
end
