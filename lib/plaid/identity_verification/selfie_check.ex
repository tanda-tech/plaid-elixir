defmodule Plaid.IdentityVerification.SelfieCheck do
  @moduledoc """
  Plaid SelfieCheck data structure.
  """
  @derive Jason.Encoder
  defstruct status: nil,
            selfies: []

  @type t :: %__MODULE__{
          status: String.t(),
          selfies: [Selfie.t()]
  }

  defmodule Selfie do
    @moduledoc """
    Plaid Selfie data structure.
    """
    @derive Jason.Encoder
    defstruct status: nil,
              attempt: nil,
              capture: nil,
              analysis: nil

    @type t :: %__MODULE__{
            status: String.t(),
            attempt: integer,
            capture: %{image_url: String.t(), video_url: String.t()},
            analysis: %{document_comparison: String.t()}
    }
  end
end
