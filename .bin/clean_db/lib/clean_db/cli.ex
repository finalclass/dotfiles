defmodule CleanDb.CLI do

  @url "http://localhost"
  
  def main(_argv) do
    fetch_dbs()
    |> Poison.Parser.parse!(%{})
    |> only_to_remove_dbs()
    |> remove_dbs()
  end

  def fetch_dbs do
    {_, %{body: body}} = HTTPoison.get(@url <> "/_all_dbs")
    body
  end
  
  def only_to_remove_dbs(dbs) when is_list(dbs) do
    Enum.filter(dbs, &db_for_removal?/1)
  end

  def db_for_removal?(db_name) do
    case :binary.match(db_name, "test") do
      {_, _} -> true
      :nomatch -> false
    end
  end

  def remove_dbs(dbs) do
    Enum.map(dbs, fn db_name ->
      remove_db(db_name, get_db_type(db_name))
    end)
  end

  def get_db_type(db_name) do
    case :binary.match(db_name, "dbnode-ev-") do
      {0, _} -> :event_db
      _ -> :regular_db
    end
  end

  def remove_db(db_name, :regular_db) do
    {_, %{body: body}} = HTTPoison.delete(@url <> "/" <> db_name)
    IO.inspect({db_name, body})
  end

  def remove_db(db_name, :event_db) do
    res = System.cmd("fc-remove-local-event", [db_name_to_eid(db_name)])
    IO.inspect({db_name, res})
  end

  def db_name_to_eid(db_name) do
    String.slice(db_name, String.length("dbnode-ev-")..-1)
  end
end
