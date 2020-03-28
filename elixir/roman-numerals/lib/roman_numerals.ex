defmodule RomanNumerals do
  @letters ["", "", "M", "D", "C", "L", "X", "V", "I"]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    @letters
    |> Enum.chunk_every(3, 2, :discard)
    |> Enum.with_index()
    |> List.foldl({"", number}, fn data, acc ->
      {iteraton_letters, power} = data
      {partial_roman_string, remaining_number} = acc

      expand_roman(
        remaining_number,
        partial_roman_string,
        round(:math.pow(10, 3 - power)),
        iteraton_letters
      )
    end)
    |> elem(0)
  end

  defp expand_roman(number, base_string, base, letters) do
    [ten, five, one] = letters
    base_times = div(number, base)
    remaining_number = rem(number, base)

    append_roman =
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

    {base_string <> append_roman, remaining_number}
  end
end
