defmodule ExKeypair.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_keypair,
     version: "0.0.2",
     elixir: "~> 1.2",
     package: package(),
     description: description(),     
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
  end

  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    RSA key pair generation in Elixir, using OpenSSL ports.
    """
  end

  defp package do
    [# These are the default files included in the package
     name: :ex_keypair,
     files: ["lib", "test", "config", "mix.exs", "README*", "LICENSE*" ],
     maintainers: ["Lef Ioannidis"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/elefthei/ex_keypair",
              "Docs" => "https://github.com/elefthei/ex_keypair"}]
  end
end
