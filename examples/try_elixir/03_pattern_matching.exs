# The Match Operator
#
# The = symbol in Elixir is called the match operator. It matches values
# on one side against corresponding structures on the other side

# String matches to empty variable
language = "Elixir"

# Pattern Matching Strings
"José " <> last_name = "José Valim"

# Pattern Matching and Lists
data = ["Elixir", "Valim"]
IO.puts data  #=> ElixirValim

[lang, author] = data
IO.puts "#{lang}, #{author}" #=> Elixir, Valim

withdrawals = [50.0, 60.75, 12.0]
[gym, cell_phone, netflix] = withdrawals
IO.puts "Gym: $#{gym}, Cell Phone: $#{cell_phone}, Netflix: $#{netflix}"


# Refactoring Conditionals That Use Arguments
#
# In functional languages like Elixir, the use of if statements
# is less common than in other languages
defmodule Account do
  def run_transaction(balance, amount, type) do
    if type == :deposit do
      balance + amount
    else
      balance - amount
    end
  end
end

# Last arguments are atoms, similar to strings but more memory efficient
Account.run_transaction(1000, 50, :deposit)
Account.run_transaction(1050, 30, :withdrawal)


# Replacing If Statements with Pattern Matching
#
# Using pattern matching in function arguments,
# we can split functions with if statements into multiple clauses.
defmodule Account do
  def run_transaction(balance, amount, :deposit) do     # 1st clause
    balance + amount
  end

  def run_transaction(balance, amount, :withdrawal) do  # 2nd clause
    balance - amount
  end
end

Account.run_transaction(1000, 50, :deposit)     # Call matches the 1st clause
Account.run_transaction(1050, 30, :withdrawal)  # Call matches the 2nd clause


# Pattern Matching and the Pipe Operator
1000
|> Account.run_transaction(50, :deposit)     # Receives 1000 as first argument
|> Account.run_transaction(30, :withdrawal)  # Receives 1050 as first argument
|> IO.puts                                   # Prints result as 1020


# Another Pattern Matching Example
defmodule Account do
  def list_deposits(deposits) do
    list_deposits(deposits, :asc)
  end

  def list_deposits(deposits, :asc) do
    sort_asc(deposits) |> list
  end

  def list_deposits(deposits, :desc) do
    sort_desc(deposits) |> list
  end

  def sort_desc(deposits) do
    Enum.sort(deposits, &(&1 > &2))
  end

  def sort_asc(deposits) do
    Enum.sort(deposits, &(&1 < &2))
  end

  def list(sorted_deposits) do
    IO.inspect Enum.map(sorted_deposits, &("US$#{&1}"))
  end
end

Account.list_deposits([9.50,5.0,13.0,3.0,1.0])

