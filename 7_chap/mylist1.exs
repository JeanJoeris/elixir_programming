defmodule MyList do
  def len([]), do: []
  def len([head | tail]), do: [head * head | len(tail)]

  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  # def adder(number) do
  #   def add_num([head | tail]) do
  #     [head + number | add_num(tail)]
  #   end
  # end

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  # def sum([], total), do: total
  # def sum([head | tail], total), do sum(tail, head + total)
  # syntax looks like sum([1,2,3], 0) returns 6

  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, head + total)

  def no_acc_sum([]), do: 0
  def no_acc_sum([head | tail]), do: head + sum(tail)

  def reduce([], acc, _func), do: acc
  def reduce([head | tail], acc, func) do
    reduce(tail, func.(head, acc), func)
  end

  def mapsum(list, func), do: _mapsum(list, func, 0)
  defp _mapsum([], func, total), do: total
  defp _mapsum([head | tail], func, total), do: _mapsum(tail, func, func.(head) + total)

  def max([head | tail]), do: _max([head | tail], head)
  defp _max([], max_elem), do: max_elem
  defp _max([head | tail], max_elem) when head > max_elem, do: _max(tail, head)
  defp _max([head | tail], max_elem), do: _max(tail, max_elem)

  def span(min, max), do: _span(min, max, [])
  defp _span(max, max, result), do: [max | result]
  defp _span(min, max, result), do: _span(min, max - 1, [max | result])
end
