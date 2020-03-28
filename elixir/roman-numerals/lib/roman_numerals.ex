defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    rem = number
    {val, rem} = whatever(number, "", 1000, "", "M", "")
    {val, rem} = whatever(rem, val, 100, "D", "C", "M")
    {val, rem} = whatever(rem, val, 10, "L", "X", "C")
    {val, rem} = whatever(rem, val, 1, "V", "I", "X")
    val
  end

  defp whatever(number, val, base, five, one, ten) do
    base_times = div(number, base)
    rem = rem(number, base)

    append_val =
      cond do
        number >= 9 * base ->
          one <> ten

        number >= 5 * base ->
          five <> String.duplicate(one, base_times - 5)

        number >= 4 * base ->
          one <> five

        number >= base ->
          String.duplicate(one, base_times)

        true ->
          ""
      end

    {val <> append_val, rem}
  end
end
