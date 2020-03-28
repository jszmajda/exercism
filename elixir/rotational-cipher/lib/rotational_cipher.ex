defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(fn c ->
      cond do
        c >= ?A && c <= ?Z ->
          set_rotate(c, ?A, ?Z, shift)

        c >= ?a && c <= ?z ->
          set_rotate(c, ?a, ?z, shift)

        true ->
          c
      end
    end)
    |> List.to_string()
  end

  defp set_rotate(char, low, high, shift) do
    cond do
      char + shift > high ->
        char + (shift - 1) - high + low

      true ->
        char + shift
    end
  end
end
