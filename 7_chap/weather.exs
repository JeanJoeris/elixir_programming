defmodule WeatherHistory do
  def for_location([], _location_number), do: []
  def for_location([ head = [_, location_number, _, _] | tail], location_number) do
    [ head | for_location(tail, location_number)]
  end
  def for_location([_ | tail], location_number), do: for_location(tail, location_number)

  def test_data do
    [
      [1366225622, 26, 15, 0.125],
      [1366225622, 27, 15, 0.45],
      [1366225622, 28, 21, 0.25],
      [1366225222, 26, 19, 0.081],
      [1366225222, 27, 17, 0.468],
      [1366225222, 28, 15, 0.60],
      [1366225822, 26, 22, 0.095],
      [1366225822, 27, 21, 0.05],
      [1366225822, 28, 24, 0.03],
      [1366225422, 26, 17, 0.025]
    ]
  end
end
