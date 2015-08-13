defmodule Mix.Nativegen do

  @moduledoc false

  @doc """
  target path
  """
  def target_path(specified_path, file_name) do
    specified_path
    |> Path.expand
    |> Path.join(file_name)
  end

  @doc """
  Transform to handle types and variables easily
  """
  def parse_params(params) when is_list(params) do
    params
    |> Enum.map(&String.split(&1, ":"))
    |> Enum.map(fn
      [variable, "array", type] ->
        {:array, variable, type}
      [variable, type] ->
        {String.to_atom(type), variable, type}
    end)
  end

  def to_camel_case(word) do
    [head | tail] = word |> String.split("_")
    capitalized = tail
                  |> Enum.map(&String.capitalize/1)
                  |> Enum.join("")
    head <> capitalized
  end

end
