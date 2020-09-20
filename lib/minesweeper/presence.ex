defmodule Minesweeper.Presence do
  use Phoenix.Presence,
    otp_app: :minesweeper,
    pubsub_server: Minesweeper.PubSub
end
