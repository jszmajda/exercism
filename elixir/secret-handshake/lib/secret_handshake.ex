use Bitwise

defmodule SecretHandshake do
  @operations ["wink", "double blink", "close your eyes", "jump"]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operat ions in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Enum.with_index(@operations)
    |> List.foldl([], fn tup, acc ->
      {e, i} = tup
      check = 0b1 <<< i

      if (code &&& check) > 0, do: acc ++ [e], else: acc
    end)
    |> (fn list ->
          if (code &&& 0b10000) > 0 do
            Enum.reverse(list)
          else
            list
          end
        end).()
  end
end
