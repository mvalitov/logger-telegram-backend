defmodule LoggerTelegramBackend.Mixfile do
  use Mix.Project

  def project do
    [
      app: :logger_telegram_backend,
      version: "1.0.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),

      # Docs
      name: "LoggerTelegramBackend",
      description: "A Logger backend for Telegram",
      source_url: "https://github.com/adriankumpf/logger-telegram-backend",
      homepage_url: "https://github.com/adriankumpf/logger-telegram-backend",
      docs: [main: "readme", extras: ["README.md"]]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {LoggerTelegramBackend.Application, []}
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:exvcr, "~> 0.8", only: :test},
      {:gen_stage, "~> 0.12"},
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/adriankumpf/logger-telegram-backend"},
      maintainers: ["Adrian Kumpf"]
    ]
  end
end
