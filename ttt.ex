# Tic-tac-toe
# iex(7)> Ttt.test
# [:tic, :toe, :tac]
defmodule Ttt do
  def test do
    self = self()
    p = spawn(fn -> first(self) end)
    send(p, :toe)
    send(p, :tac)
    send(p, :tic)

    receive do # 'Prints' result
      {:ok, res} -> res
    end
  end

  def first(p) do
    receive do
      :tic -> second(p, [:tic])
      :tac -> second(p, [:tac])
    end
  end

  def second(p, all) do
    receive do
      :tic -> third(p, [:tic|all])
      :tac -> third(p, [:tac|all])
      :toe -> third(p, [:toe|all])
    end
  end

  def third(p, all) do
    receive do
      x -> send(p, {:ok, [x|all]})
    end
  end

end
