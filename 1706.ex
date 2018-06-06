defmodule T1706 do

  def start do
    transf(5, 2, [5,1,2,3,4,5])
    sum([10,20,30,40,50])
  end

  # 2.1 Skriv en funktion, transf(X,Y,L), som tar två värden, X och Y, och en lista av tal och returnerar en lista där alla värden lika med X har plockats bort och övriga multplicertas med Y. Om vi evaluerar transf(5, 2, [2,5,4,3,5]) skall resultatet vara [4,8,6].
  def transf(_,_,[]) do # when the array is empty, trasf(x,y,t) is set to [] and when the rest
    []
  end
  def transf(x,y,[x|r]) do # if x is head of list, then call transf without it (only the rest of the list)
  transf(x,y,r)
  end
  def transf(x,y, [h|r]) do
    [h*y|transf(x,y,r)]
  end

  # 2.2 Nedan 􏰃nns de􏰃nitionen av funktionen sum/1 som summerar elementen i en lists. Skriv om fuktionen så att den är svansrekursiv.
  def sum(l) do # takes a list and calls sum with two arguments, the list and a 0, to start the sumation
    sum(l, 0)
  end
  def sum([], s) do # then returns that sum
    s
  end
  def sum([h|t], s) do # takes the head from the list and adds that to s, recursively until the list is empty
    sum(t, h+s)
  end

  #2.3 Antag att ett träd är representerat med atomen nil för en tom gren och strukturen {node, Value, Left, Right} för en nod i trädet där värdet i en nod är ett heltal. Skriv en funktion min/1 som hittar det minsta värdet i ett träd eller returnerar inf om trädet är tomt. Du kan använda dig av det faktum att alla tal är mindre än atomer dvs 3 < inf är sant.
  def min(tree) do # takes a tree and calls min with tree and an atom :inf
    min(tree, :inf)
  end
  def min(nil, m) do # if the tree is traversed, 'return' min
    m
  end
  def min({:node, v, left, right}, m) do
    if v < m do
      min(left, min(right, v))
    else
      min(left, min(right, m))
    end
  end







end
