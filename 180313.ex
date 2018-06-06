defmodule T do
  def test do
    # lambda calculus
    IO.puts lambda1
    IO.puts lambda2
    IO.puts lambda3
    # pattern matching
    # IO.puts pattern
    IO.puts pattern1
    IO.puts pattern2
    IO.puts pattern3
    # IO.puts pattern4
    IO.puts pattern5
    # test sum, gets heap from heap.ex
    heap = Heap.new
    heap = Heap.add(heap, 2)
    heap = Heap.add(heap, 4)
    heap = Heap.add(heap, 10)
    heap = Heap.add(heap, 6)
    IO.puts sum(heap)
    IO.inspect heap
    # tail recursion
    # reverse
    a = reverse([1,2,3,4,5])
    append([1,2,3,4,5],[6,7,8,9])
    # mirror a tree
    IO.puts mirror(heap)
  end
  # lambda functions
  def lambda1, do: fn(x) -> x + 5 end .(4)
  def lambda2, do: fn(x) -> fn(y) -> x + 2 * y end .(3) end .(5)
  def lambda3, do: fn(z) -> z + z end .(fn(x) -> x end .(5))

  # pattern functions
  # with an anonymous function, works but not that practical in this case?
  def pattern, do: fn([x, y | z]) -> IO.puts "x = #{inspect x}, y = #{inspect y}, z = #{inspect z}" end .(fn(list) -> [x, y | z] = list end .([1,2,3]))

  # with a regular function
  def pattern1 do
    [x,y | z] = [1,2,3]
    IO.puts "x = #{inspect x}, y = #{inspect y}, z = #{inspect z}"
  end
  def pattern2 do
    [x,y | z] = [1,[2,3]]
    IO.puts "x = #{inspect x}, y = #{inspect y}, z = #{inspect z}"
  end
  def pattern3 do
    [x,y | z] = [1|[2,3]]
    IO.puts "x = #{inspect x}, y = #{inspect y}, z = #{inspect z}"
  end
  def pattern5 do
    [x,y | z] = [1,2,3,4]
    IO.puts "x = #{inspect x}, y = #{inspect y}, z = #{inspect z}"
  end

  # Implementear en funktion, sum/1, som tar ett träd och returnerar summan av alla värden i trädet. Trädet är representerat som följer:
  # @type tree :: {:heap, integer(), tree(), tree()} |  nil
  def sum(nil) do
    0
  end
  # adds the max in heap 'v' and then recursively adds the max in the left child and max in the right child until all children are traversed
  def sum({:heap, v, left, right}) do
    IO.write "#{v} "
    v + sum(left) + sum(right)
    # IO.puts "v #{v}, sum(left) #{sum(left)}, sum(right) #{sum(right)}"
  end

  # Return a list in reverse order
  def reverse([], b) do
    b
  end
  def reverse([h|t], b) do
    IO.puts "h = #{inspect h}"
    IO.puts "t = #{inspect t}"
    IO.puts "b = #{inspect b} \n"
    reverse(t, [h|b]) # iex(55)> [1|[]      ger oss [1]
                      # iex(56)> [2|[1]]    ger oss [2, 1]
                      # iex(57)> [3|[2,1]]  ger oss [3, 2, 1]
                      # o.s.v.
  end
  def reverse(a) do
    IO.puts "a = #{inspect a} \n"
    reverse(a, [])
  end

  # append that uses reverse
  def append(a, b) do
    # reverse(a ++ b)
    # a ++ [b]
    reverse(reverse(a),b)
  end

  # mirrot a tree
  def mirror(nil) do
    nil
  end
  def mirror({:heap, left, right}) do
    {:heap, mirror(right), mirror(left)}
  end
end
