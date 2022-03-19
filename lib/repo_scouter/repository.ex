defmodule RepoScouter.Repository do
  @keys [:name, :language, :url]

  @enforce_keys @keys

  defstruct @keys

  @derive Jason.Encoder

  def build(%{"name" => name, "language" => language, "url" => url}) do
    %__MODULE__{
      name: name,
      language: language,
      url: url
    }
  end
end
