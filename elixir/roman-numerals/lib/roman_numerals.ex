defmodule RomanNumerals do
  @digits [
    {"M", 1000},
    {"D", 500},
    {"C", 100},
    {"L", 50},
    {"X", 10},
    {"V", 5},
    {"I", 1}
  ]
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    @digits
    |> Enum.reduce({number, ""}, fn digit_tuple, acc_tuple ->
      {roman_numeral, numeral_value} = digit_tuple
      {rem, roman} = acc_tuple

      {newnum, romo} =
        if rem >= numeral_value do
          mod = div(rem, numeral_value)
          {rem - numeral_value * mod, String.duplicate(roman_numeral, mod) <> roman}
        else
          {rem, roman}
        end

      {newnum, romo}
    end)
    |> elem(1)
  end
end
