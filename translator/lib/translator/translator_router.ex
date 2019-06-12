defmodule Translator.Router do
    use Plug.Router
    use Plug.Debugger
    require Logger

    plug(Plug.Logger, log: :debug)

    plug(:match)
    plug(:dispatch)

    get "/greeting/:lang" do
        gs = %{"en_GB" => "Hello", "en_US" => "hey", "es_ES" => "Hola"}

        conn |>
        send_resp(200, gs[lang] || "unknown")
    end

    match _ do
        conn |>
        send_resp(404, "not found")
    end
end
