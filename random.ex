defmodule API do
  def random do
    time = :rand.uniform(1000)
    :timer.sleep(time)
    time
  end
end

[
  Task.async(&API.random/0),
  Task.async(&API.random/0),
  Task.async(&API.random/0)
]
|> Enum.map(&Task.await/1)
|> IO.inspect

# IO.inspect [API.random, API.random, API.random]

defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

IO.inspect Benchmark.measure(fn -> API.random end)
