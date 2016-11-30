# fizz_buzz_response = fn
#   0, 0, num -> "FizzBuzz"
#   0, not_zero, num -> "Fizz"
#   not_zero, 0, num -> "Buzz"
#   arg_1, arg_2, num -> num
# end
#
# fizz_buzz = fn
#   num -> fizz_buzz_response.(rem(num,3), rem(num,5), num)
# end

defmodule FizzBuzz do

  def of(num) do
    fizz_buzz_response rem(num, 5), rem(num, 3), num
  end

  defp fizz_buzz_response(0, 0, num) do
     "FizzBuzz"
  end

  defp fizz_buzz_response(0, remainder_3, num) do
     "Buzz"
  end

  defp fizz_buzz_response(remainder_5, 0, num) do
     "Fizz"
  end

  defp fizz_buzz_response(remainder_5, remainder_3, num) do
    num
  end
end
