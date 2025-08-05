defmodule Secrets do
  def secret_add(secret) do
    fn param -> param + secret end
  end

  def secret_subtract(secret) do
    &(&1 - secret)
  end

  def secret_multiply(secret) do
    &(&1 * secret)
  end

  def secret_divide(secret) do
    &(div(&1, secret))
  end

  def secret_and(secret) do
    &(Bitwise.band(&1, secret))
  end

  def secret_xor(secret) do
    &(Bitwise.bxor(&1, secret))
  end

  def secret_combine(secret_function1, secret_function2) do
    fn param ->
      secret_function2.(secret_function1.(param))
    end
  end
end

IO.puts(Secrets.secret_add(2).(3)) # 5
IO.puts(Secrets.secret_subtract(2).(5)) # 3
IO.puts(Secrets.secret_multiply(3).(4)) # 12
IO.puts(Secrets.secret_divide(2).(8)) # 4
IO.puts(Secrets.secret_and(6).(10)) # 2
IO.puts(Secrets.secret_xor(6).(10)) # 12
combined_function = Secrets.secret_combine(Secrets.secret_add(2), Secrets.secret_multiply(3))
IO.puts(combined_function.(4)) # 18

"""
https://exercism.org/tracks/elixir/exercises/secrets

Instructions
In this exercise, you've been tasked with writing the software for an encryption device that works by performing transformations on data. You need a way to flexibly create complicated functions by combining simpler functions together.

For each task, return an anonymous function that can be invoked from the calling scope.

All functions should expect integer arguments. Integers are also suitable for performing bitwise operations in Elixir.

1. Create an adder
Implement Secrets.secret_add/1. It should return a function which takes one argument and adds to it the argument passed in to secret_add.

adder = Secrets.secret_add(3)
adder.(2)
# => 5
2. Create a subtractor
Implement Secrets.secret_subtract/1. It should return a function which takes one argument and subtracts the secret passed in to secret_subtract from that argument.

subtractor = Secrets.secret_subtract(2)
subtractor.(3)
# => 1
3. Create a multiplier
Implement Secrets.secret_multiply/1. It should return a function which takes one argument and multiplies it by the secret passed in to secret_multiply.

multiplier = Secrets.secret_multiply(7)
multiplier.(3)
# => 21
4. Create a divider
Implement Secrets.secret_divide/1. It should return a function which takes one argument and divides it by the secret passed in to secret_divide.

divider = Secrets.secret_divide(3)
divider.(32)
# => 10
Make use of integer division so the output is compatible with the other functions' expected input.

5. Create an "and"-er
Implement Secrets.secret_and/1. It should return a function which takes one argument and performs a bitwise and operation on it and the secret passed in to secret_and.

adder = Secrets.secret_and(1)
adder.(2)
# => 0
6. Create an "xor"-er
Implement Secrets.secret_xor/1. It should return a function which takes one argument and performs a bitwise xor operation on it and the secret passed in to secret_xor.

xorer = Secrets.secret_xor(1)
xorer.(3)
# => 2
7. Create a function combiner
Implement Secrets.secret_combine/2. It should return a function which takes one argument and applies to it the two functions passed in to secret_combine in order.

add_one = Secrets.secret_add(1)
multiply_by_2 = Secrets.secret_multiply(2)
combined = Secrets.secret_combine(add_one, multiply_by_2)

combined.(3)
# => 8
"""
