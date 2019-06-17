defmodule Translator do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(scheme: :http, plug: Translator.Router, options: [port: 8080])
    ]
    opts = [strategy: :one_for_one, name: Translator.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
