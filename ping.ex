# Ping Pong
# Sends ping and pong back and forth as messages to eachother
defmodule PP do
  def start do
    ping = spawn(fn -> ping end)
    pong = spawn(fn -> pong end)
    send(ping, {:ping, pong}) # send('to'ping, {'message':ping, 'from'pong})
  end

  def ping do
    receive do
      # Check for messages, if a message pattern matches {:ping, from} then do stuff
      {:ping, from} ->  IO.puts "        <- pong"
                        Process.sleep 500
                        send(from, {:pong, self})
    end
    ping # make sure to make a recursive call, otherwise the process will die
  end

  def pong do
    receive do
      # Check for messages, if a message pattern matches {:pong, from} then do stuff (printput, sleep, send your own message back to the one you got your message from)
      {:pong, from} ->  IO.puts "ping ->"
                        Process.sleep 500
                        send(from, {:ping, self})
    end
    pong # make sure to make a recursive call, otherwise the process will die
  end
end
