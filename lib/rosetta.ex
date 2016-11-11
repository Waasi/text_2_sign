defmodule Rosetta do
  defmacro languages(list_of_languages) do
    for language <- list_of_languages do
      quote do
        def unquote(:"from_#{Atom.to_string(language)}")(word) do
          module = unquote(language) |> Atom.to_string |> String.capitalize

          fetcher = Module.concat([Text2Sign, module, Fetcher])
          parser = Module.concat([Text2Sign, module, Parser])

          case word |> fetcher.fetch do
            {:ok, page} -> page |> parser.parse
            _error -> ""
          end
        end
      end
    end
  end
end
