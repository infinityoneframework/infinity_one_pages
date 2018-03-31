defmodule InfinityOnePagesWeb.PageController do
  use InfinityOnePagesWeb, :controller

  alias InfinityOnePages.Github.Server
  alias InfinityOnePages.Version

  require Logger

  def index(conn, _params) do
    {templ, bindings} =
      case Server.get() do
        {:ok, version} ->
          get_download_url(conn, version)
        {:error, _timeout} ->
          get_download_url(conn, Server.get_last())
      end
    render conn, templ, bindings
  end

  defp get_download_link(:mac, version), do: Version.get_mac_download_link(version)
  defp get_download_link(:win, version), do: Version.get_win_download_link(version)
  defp get_download_link(:linux, version), do: Version.get_linux_download_link(version)
  defp get_download_link(platform, _version) when is_atom(platform), do: nil

  defp get_download_url(_conn, nil) do
    {"index.html", []}
  end

  defp get_download_url(conn, version) do
    platform = match_user_agent(conn)
    # Logger.warn "platform: " <> inspect(platform)
    {"index_#{platform}.html", [url: get_download_link(platform, version)]}
  end

  defp match_user_agent(%{req_headers: headers}) do
    agent =
      case List.keyfind(headers, "user-agent", 0) do
        {_, agent} -> agent
        _ -> ""
      end
    cond do
      agent =~ ~r/Android/ -> :unsupported
      agent =~ ~r/iPhone/ -> :unsupported
      agent =~ ~r/iPad/ -> :unsupported
      agent =~ ~r/Macintosh/ -> :mac
      agent =~ ~r/Windows/ -> :win
      agent =~ ~r/Linux/ -> :linux
      true -> :unknown
    end
  end
end
