defmodule Mix.Tasks.Swiftgen.Create do
  use Mix.Task

  @shortdoc "Create specified swift repository code"

  @moduledoc """
  Create scaffold repository code.

  ## Example
    mix swiftgen.create User users username:string group:has_one:Group items:has_many:Item
  """

  def run(args) do
  end

end
