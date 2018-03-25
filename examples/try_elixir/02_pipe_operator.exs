# The Problem with Multiple Nested Calls
#
#  f(x)
#  g(f(x), y)
#  j(i(h(g(f(x), y), z)))

# Example Nested Call
#
# The problem with this approach is that
# you have to read the code inside-out
defmodule Account do
  def balance(initial, spending) do
    interest(discount(initial, 10), 0.1)
  end

  def discount(total, amount) do
    total - amount
  end

  def interest(total, rate) do
    total + (total * rate)
  end
end

# Temporary variables are not the best solution
defmodule Account do
  def balance(initial, spending) do
    # Second here     # You first read here
    discount_amount = discount(initial, 10)
    # Lastly here     # Then here
    interest_amount = interest(discount_amount, 0.1)
    interest_amount
  end
end

# The Pipe Operator
defmodule Account do
  def balance(initial, spending) do
    # Easier to read from left to right
    # Passes result as first argument
    discount(initial, 10) |> interest(0.1)
  end
end

# Example of Chaining
defmodule Account do
  def balance(initial, spending) do
    # Lines that are too long can become hard to maintain
    discount(initial, 10) |> interest(0.1) |> format("$")
  end
end

# Improving readability
defmodule Account do
  def balance(initial, spending) do
    # Easier to read as multiple lines
    discount(initial, 10)
    |> interest(0.1)
    |> format("$")
  end
end

# Piping to Elixir Functions
#
# The Enum.sum function from Elixir's standard library returns
# the sum of all individual elements passed as argument
defmodule Account do
  def print_sum do
    1..10               # The two dots create a range form 1 to 10
    |> Enum.sum         # Takes range as single argument
    |> IO.puts          # Takes result of sum as single argument
  end
end

# Piping Strings
"Elixir" |> String.upcase |> IO.puts
