defmodule Ceaser do
  def encode(string, offset) when is_binary string do
    _encode(String.to_charlist(string), rem(offset, 26), [])
  end

  def encode(charlist, offset) when is_list charlist do
    _encode(charlist, rem(offset, 26), [])
  end

  defp _encode([], _number, encoded_string), do: List.to_string(encoded_string)

  defp _encode([head | tail], offset, encoded_string) when head + offset > 122 do
    shifted_letter_position = find_encoded_codepoint(head, offset)
    _encode(tail, offset, [encoded_string, 97 + shifted_letter_position])
  end

  defp _encode([head | tail], offset, encoded_string) when head + offset < 97 do
    encoded_letter_codepoint = find_encoded_codepoint(head, offset)
    _encode(tail, offset, [encoded_string, 122 + shifted_letter_position])
  end

  defp _encode([head | tail], offset, encoded_string) do
    _encode(tail, offset, [encoded_string, head + offset])
  end

  defp find_encoded_codepoint(starting_codepoint, offset) do
    rem(starting_codepoint + offset - 97, 26)
  end
end
