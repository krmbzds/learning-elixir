# Working with Pure Functions

# How to determine if a function is pure?
#
# 1. Return value relying entirely on arguments
# 2. No side effects

# Pure Functions in FP vs. Object State in OO
#
# 1. Object State - Object-oriented Languages
# (Some info is hidden from the caller)
#
#   Q: What is my current account balance?
#   A: It depends on how much you initially had and how much was spent.
#
#   account.currentBalance()  # The account object holds the information
#
# 2. Pure functions - Functional Languages
# (Function recievers all data necessary to perform the operation)
#
#   Q: Starting the month with $1000, when I spend $200, what is my balance?
#   A: The account balance is $1000 - $200 = $800
#
#   Account.balance(1000, 200)  # No dependencies!
