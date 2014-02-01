defmodule Glass do
  defp parse_glass(binary) do
    Enum.map Enum.chunk(String.to_char_list!(binary), 10), fn(chunk) ->
      Enum.map String.codepoints(iolist_to_binary(chunk)), fn(token) ->
        case binary_to_atom(token) do
          :' ' -> :_
          :'*' -> :O
        end
      end
    end
  end

  def parse(binary) do
    Enum.map String.split(binary, "&"), fn(pair) ->
      [name, value_raw] = String.split(pair, "=")
      name_atom = binary_to_atom(name)
      value = case name_atom do
        :figure -> binary_to_atom(value_raw) # :O, :I, :J, :L, :S, :Z, :T
        :x -> binary_to_integer(value_raw)
        :y -> binary_to_integer(value_raw)
        :glass -> parse_glass(value_raw)
        :next -> Enum.map String.codepoints(value_raw), &binary_to_atom/1
        _ -> nil
      end
      {name_atom, value}
    end
  end
end
