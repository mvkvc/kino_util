defmodule KinoUtil.MixProject do
  use Mix.Project

  @name "kino_util"
  @description "Livebook smart cell to show system utilization."
  @version "0.1.1"
  @source_url "https://github.com/mvkvc/kino_util"

  def project do
    [
      app: :kino_util,
      name: @name,
      description: @description,
      source_url: @source_url,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      docs: docs(),
      deps: deps(),
      aliases: aliases(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :os_mon],
      mod: {KinoUtil.Application, []}
    ]
  end

  defp docs do
    [
      extras: [{:"README.md", [title: "Overview"]}],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end

  defp deps do
    [
      {:kino, "~> 0.9.4"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      docs: "docs --formatter html"
    ]
  end

  defp package() do
    [
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mvkvc/kino_util"}
    ]
  end
end
