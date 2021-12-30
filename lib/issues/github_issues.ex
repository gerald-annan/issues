defmodule Issues.GithubIssues do
  @user_agent [{"User-agent", "Elixir dave@pragprog.com"}]
  @github_url Application.get_env(:issues, :github_url)
  require Logger

  @spec fetch(any, any) ::
          {:error,
           false
           | nil
           | true
           | binary
           | [false | nil | true | binary | list | number | {any, any, any} | map]
           | number
           | %{
               optional(atom | binary | {any, any, any}) =>
                 false | nil | true | binary | list | number | {any, any, any} | map
             }}
          | {:ok,
             false
             | nil
             | true
             | binary
             | [false | nil | true | binary | list | number | {any, any, any} | map]
             | number
             | %{
                 optional(atom | binary | {any, any, any}) =>
                   false | nil | true | binary | list | number | {any, any, any} | map
               }}
  def fetch(user, project) do
    Logger.info("Fetching #{user}'s project #{project}")

    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({_, %{status_code: status_code, body: body}}) do
    Logger.info("Got response: status code=#{status_code}")

    {
      status_code |> check_for_error(),
      body |> Poison.Parser.parse!()
    }
  end

  defp check_for_error(200), do: :ok
  defp check_for_error(_), do: :error
end
