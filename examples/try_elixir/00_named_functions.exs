# Defining Named Functions
# All named functions in Elixir must be a part of an enclosing module.

defmodule Account do
  def balance(initial, spending) do
    initial - spending
  end

  def investment_return(initial, interest) do
    initial + (initial * interest)
  end
end

# Invoking Named Functions
# Named functions are invoked using the dot notation and preceded by their module name.

current_balance = Account.balance(1000, 200)
IO.puts "Current balance: US $#{current_balance}"

amount = Account.investment_return(1000, 0.0001)
IO.puts "Investment return: $#{amount}"

# Running Elixir Programs
elixir 00_named_functions.exs
