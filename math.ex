# Math module
defmodule Math do
  # Tests
  def test do
    # Test square Function
    square = square(4)
  end
  # Squares a value unless its smaller than i, result: a list of tuples with each result value
  # Example result: Math.square(5) -> {:done, [{:nr, 1, :value, 25}, {:nr, 2, :value, 625}, {:nr, 3, :value, 390625}]}
  def square(v, i, n) when i > 5 do
    # IO.puts("done")
    # IO.puts(v)
    {:done, n ++ [{:nr, i, :value,  v}]}
  end
  def square(v, i, n) do
    # IO.puts("two arguments")
    # IO.puts(v)
    square(v * v, i + 1, n ++ [{:nr, i, :value,  v}]) # Recursive call with new same argument, but modied: squared value, i=i+1, and add the new valu tuple to the list
  end
  def square(v) do
    # IO.puts("one argument")
    # IO.puts(v)
    square(v * v, 1, []) # Recursive call with new argument: squared value, 1, empty list
  end

  # Display every value up to n
  def count(n) do
    case n do
      0 -> :stop
      _any_other_value -> count(n - 1) && IO.inspect n
    end
  end
end
