# Namnet på modulen måste skrivas med STOR bokstav i början.
defmodule Heap do

  def start do
    heap = Heap.new
    heap = Heap.add(heap, 2)
    heap = Heap.add(heap, 4)
    heap = Heap.add(heap, 6)
    heap = Heap.add(heap, 8)
    heap = Heap.add(heap, 3)
    mini(heap)
  end
  @type heap() :: nil | {:heap, integer(), heap(), heap()} # De􏰃nera en datastruktur som är lämplig till att representera en heap och implementera en funktion new/0 som returnerar en heap. Antag att vi bara skall hantera heltal.

  @spec new() :: heap() # :: means that the function on the left side returns a value whose type is what’s on the right side. Function specs are written with the @spec directive, placed right before the function definition.
  def new do
    nil
  end

  @spec add(heap(), integer()) :: heap() # Implementera funktionen add/2 som adderar ett tal till en heap.
  def add(nil, v) do
    {:heap, v, nil, nil}
  end
  def add({:heap, k, left, right}, v) when k > v do
    IO.inspect {:heap, k, add(right, v), left}
  end
  def add({:heap, k, left, right}, v) do
    {:heap, v, add(right, k), left}
  end

  @spec pop(heap()) :: :fail | {:ok, integer(), heap()} # Implementera funktionen pop/1 som plockar ut det högsta elementet ur en heap och returnerar antingen :fail, om heapen är tom, eller {:ok, integer(), heap()}
  def pop(nil), do: :fail
  def pop({:heap, k, nil, right}) do # if only right is left
    {:ok, k, right}
  end
  def pop({:heap, k, left, nil}) do # if only left is left
    {:ok, k, left}
  end
  def pop({:heap, k, left, right}) do # begin here, takes a heap
    {:heap, l, _, _} = left
    {:heap, r, _, _} = right
    if l < r do
      {:ok, _, rest} = pop(right)
      {:ok, k, {:heap, r, left, rest}}
    else
      {:ok, _, rest} = pop(left)
      {:ok, k, {:heap, l, rest, right}}
    end
  end

  @spec swap(heap(), integer()) :: {:ok, integer(), heap()}

  def swap(nil, v) do
    {:ok, v, nil}
  end
  def swap({:heap, k, left, right}, v) do
    {:ok, v, left} = swap(left, v)
    {:ok, v, right} = swap(right, v)
    {:ok, k, {:heap, v, left, right}}
  end
  def swap(heap, v) do
    {:ok, v, heap}
  end

  def mini(tree) do # takes a tree and calls min with tree and an atom :inf
    mini(tree, :inf)
  end
  def mini(nil, m) do # if the tree is traversed, 'return' min
    m
  end
  def mini({:heap, v, left, right}, m) do
    # IO.puts v
    if v < m do
      mini(left, mini(right, v))
    else
      mini(left, mini(right, m))
    end
  end



end
