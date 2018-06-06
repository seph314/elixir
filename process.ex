defmodule P do
  
  def start do
    spawn(fn -> closed end)
  end

  def closed do
    IO.puts "closed"
    receive do
      2 -> two
      _ -> closed
    end
  end

  def two do
    IO.puts "two"
    receive do
      4 -> four
      2 -> two
      _ -> closed
    end
  end

  def four do
    IO.puts "four"
    receive do
      2 -> two
      6 -> six
      _ -> closed
    end
  end

  def six do
    IO.puts "six"
    receive do
      2 -> two
      _ -> closed
    end
  end

end
