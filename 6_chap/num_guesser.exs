defmodule Chop do
  def guess(number, min..max) do
    guess_until_done(number, min..max, avg_number min..max)
  end

  defp guess_until_done(num, min..max, guess_num) when guess_num == num do
    IO.puts "The number is #{num}"
  end

  defp guess_until_done(num, min..max, guess_num) when num in div(min + max, 2) + 1..max do
    IO.puts "Is the number #{guess_num}?"
    IO.puts "Hmm, it is bigger? Must be in #{avg_number(min..max) + 1}..#{max} \n"
    min..max = avg_number(min..max) + 1..max
    guess_until_done num, min..max, avg_number(min..max)
  end

  defp guess_until_done(num, min..max, guess_num) do
    IO.puts "Is the number #{guess_num}?"
    IO.puts "Hmm, it is smaller? Must be in #{min}..#{avg_number(min..max)} \n"
    min..max = min..avg_number(min..max)
    guess_until_done num, min..max, avg_number(min..max)
  end

  defp avg_number(min..max) do
    div(min + max, 2)
  end
end
