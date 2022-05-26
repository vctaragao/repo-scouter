defmodule RepoScouter.Repository do
  @keys [:name, :language, :url]

  @derive Jason.Encoder

  @enforce_keys @keys

  defstruct @keys

  def build(%{"name" => name, "language" => language, "url" => url}) do
    %__MODULE__{
      name: name,
      language: language,
      url: url
    }
  end
end
