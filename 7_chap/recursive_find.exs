defmodule RecursiveLength do
  def length_of([]), do: 0
  # def length_of([_ | tail]), do: 1 + length_of(tail)
  # line 5 is just more explicit version of line 3
  def length_of([_head | tail]), do: 1 + length_of(tail)
end
