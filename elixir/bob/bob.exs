defmodule Teenager do
  @moduledoc"""
  Responds to inputs in a surly way
  """
  @doc"""
  Responds to inputs in a surly way
  """
  def hey(input) do
    cond do
      String.length(String.rstrip(input)) == 0 ->
        "Fine. Be that way!"
      String.upcase(input) == input && String.contains?(input, all_the_letters) ->
        "Woah, chill out!"
      String.last(input) == "?" ->
        "Sure."
      true ->
        "Whatever."
    end
  end

  defp all_the_letters do
    String.codepoints(to_string(Enum.to_list(?A..?Z) ++ Enum.to_list(?a..?z)))
  end
end
