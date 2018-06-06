# A practise module based on Derek Banes Elixir Tutorial
# https://www.youtube.com/watch?v=pBNOavRoNL0
defmodule M do

  # Run some functions
  def test do
    #data_stuff()
    #do_stuff()
    #conditions()
    #lists()
    #anonymous()
    #factorial_input()
    # loop_input()
    count_to(10)
    list = [1,2,3,4,5,6,7]
    each(list, fn(num) -> IO.puts "#{num} + 10 = #{num + 10}" end)
  end

  # Take input and print it out
  def name do
    name = IO.gets "Whats your name? " |> String.trim
    IO.puts "Hello #{name}"
  end

  # Test some data types
  def data_stuff do
    my_int = 123
    IO.puts "Integer #{is_integer(my_int)}"

    my_float = 3.14159
    IO.puts "Float #{is_float(my_float)}"

    my_atom = :atom
    IO.puts "Atom #{is_atom(my_atom)}"
  end

  # Test more stuff
  def do_stuff do
    # String concatination
    my_str = "My sentence"
    longer_str = my_str <> " is longer"
    # Equality test
    IO.puts "Equal: #{"Egg" === "egg"}"
    IO.puts "Does '#{my_str}' contain 'My': #{String.contains?(my_str, "My")}"

    IO.inspect String.split(longer_str, " ")
    IO.puts is_list(longer_str)
  end

  # Test if else in a output
  def conditions do
    age = IO.gets "Whats your age: "
    age = String.to_integer(String.trim(age))
    IO.puts "Ok, then:  #{if age > 18, do: "Can vote", else: "Can't vote"}"
  end

  def lists do
    list1 = [1,2,3]
    list2 = [4,5,6]
    list3 = list1 ++ list2
    IO.write "list 1: "
    IO.inspect list1
    IO.write "list 2: "
    IO.inspect list2
    IO.write "list 3: "
    IO.inspect list3
    [head|tail] = list3
    IO.write "head of list 3: "
    IO.inspect head
    IO.write "tail of list 3: "
    IO.inspect tail

    # Enum
    Enum.each tail, fn item ->
      IO.write item end
    # Works with anything in a list, ie words
    words = ["Some", "random", "words", "in", "a", "list"]
    Enum.each words, fn word ->
      IO.puts word end

    display_list(words ++ ["Yeah, added word!"]) # calls method and adds a word

    # some pattern matching
    [_, [_, a]] = [20, [30, 40]]
    IO.puts "Get num: #{a}"
  end

  # Recurisive function that displays a list
  def display_list([word|words]) do # Breaks the head from the tail
    IO.puts word # prints the head
    display_list(words) # recursive call with the tail as argument
  end
  def display_list([]) do
    :done
  end

  # anonymous functions
  def anonymous do
    get_sum = fn(x, y) -> x + y end # defines a function that takes two arguments (x and y), and the adds them together. When we wnat to use this function we can use the variable it is 'saved in' and call it, just remember the '.' before the ()
    IO.puts "5 + 5 = #{get_sum.(5,5)}"

    get_less = &(&1 - &2) # yoy can write it like this, but it may be a litte confusing to read?

    IO.puts "7 - 6 = #{get_less.(7,6)}" # remember the dot! :)

    # can take a number of different arguments
    add_sum = fn
    {x, y} -> IO.puts "#{x} + #{y} = #{x + y}"
    {x, y, z} -> IO.puts "#{x} + #{y} + #{z} = #{x + y + z}" end

    add_sum.({1,2})
    add_sum.({1,2,3})

  end

  def factorial_input do
    num = IO.gets "Number to calculate factorial of: "
    num = String.to_integer(String.trim(num))
    IO.puts "Factorial of 4: #{factorial(num)}"
  end

  # recursive factorial
  # def factorial(num) do
  #   if num <= 1 do
  #     1
  #   else
  #     num * factorial(num - 1)
  #   end
  def factorial(num) when num <= 1 do
    1
  end
  def factorial(num) do
    num * factorial(num - 1)
  end
  # 1st : result = 4 * factorial(3) = 4 * 6 = 24
  # 2st : result = 3 * factorial(2) = 3 * 2 = 6
  # 3st : result = 2 * factorial(1) = 2 * 1 = 2

  def loop_input do
    IO.puts "Sum: #{sum([1,2,3])}"
    loop(5,2)
  end

  # calculates the sum of a list recursively
  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  # loops through values between max and min
  def loop(0, _), do: nil
  def loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts "Num : #{max}"
      loop(max - 1, min)
    end
  end

  # def enum_input do
  #   IO.puts "Even List : #{Enum.all?([1,2,3])}"
  #   fn(n) -
  # end

  def count_to(m, n) when m < n do
    :done
  end
  def count_to(m, n) do
    IO.puts "nr: #{n}"
    count_to(m, n + 1)
  end
  def count_to(m) do
    count_to(m,1)
  end

  # def count_to(n) do
  #   IO.puts "n = #{n}"
  #   n + count_to(n-1) # && IO.inspect n
  # end

  def each([], _func) do
    :done
  end
  def each([head|tail], func) do
    func.(head)
    each(tail, func)
  end




end
