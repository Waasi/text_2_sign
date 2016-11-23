defmodule Text2Sign.Spanish.Server do
  use GenServer

  #####
  # Public API
  #####

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def translation(""), do: {:error, "invalid word "}
  def translation(word) do
    GenServer.call(__MODULE__, {:translate, word})
  end

  #####
  # Callbacks
  #####

  def init(_) do
    :ets.new(:translations, [:named_table])

    case get_translations() do
      {:ok, dataset} ->
        dataset
        |> Enum.each(fn record ->
          :ets.insert(:translations, {record["Palabra"]["word"], record})
        end)
      {:error, error} ->
        {:error, error}
    end

    {:ok, "Server Started"}
  end

  def handle_call({:translate, word}, _from, state) do
    {:reply, translate(word), state}
  end

  #####
  # Private API
  #####

  defp translate(word) do
    case :ets.lookup(:translations, word) do
      [{^word, response}] -> {:ok, response}
      _error -> {:error, "invalid word #{word}"}
    end
  end

  def get_translations do
    response = HTTPoison.get!("http://diccionariodesenas.umce.cl/json/palabras/glosas.json", [], [recv_timeout: :infinity])

    case response do
      %HTTPoison.Response{body: body, status_code: 200} ->
        {:ok, body |> Poison.decode!}
      _error_response ->
        {:error, "unable to fetch words translations"}
    end
  end
end
