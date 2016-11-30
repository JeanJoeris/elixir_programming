defmodule EnumWithoutEnum do
  def all?(list, func), do: _all?(list, func, true)
  defp _all?([], _func, result), do: result
  defp _all?([head | tail], func, result) do
    _all?(tail, func, func.(head) and result)
  end

  def each(list, func), do: _each(list, func)
  defp _each([], _func), do: :ok
  defp _each([head | tail], func) do
    func.(head)
    _each(tail, func)
  end

  def filter(list, condition), do: _filter(list, condition, [])
  defp _filter([], _condition, result), do: result
  defp _filter([head | tail], condition, result) do
    if condition.(head) == true do
      _filter(tail, condition, [head | result])
    else
      _filter(tail, condition, result)
    end
  end

  def split(list, count), do: _split(list, count, [])
  defp _split(list, count, result) when length(result) == count do
    [Enum.reverse(result), list]
  end
  defp _split([head | tail], count, result) when length(result) < count do
    _split(tail, count, [head | result])
  end

  def take(list, number), do: _take(list, number, [])
  defp _take(_list, number, result) when length(result) == number, do: Enum.reverse(result)
  defp _take([head | tail], number, result) when length(result) < number do
    _take(tail, number, [head | result])
  end
end
