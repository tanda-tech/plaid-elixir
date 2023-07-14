defmodule Plaid.IdentityVerification.DocumentaryVerification do
  @moduledoc """
  Plaid Documentary Verification data structure.
  """
  @derive Jason.Encoder
  defstruct status: nil,
            documents: nil

  @type t :: %__MODULE__{
          status: String.t(),
          documents: [Documents.t()]
  }

  defmodule Documents do
    @moduledoc """
    Documents data structure.
    """
    @derive Jason.Encoder
    defstruct status: nil,
              attempt: nil,
              images: nil,
              extracted_data: nil,
              analysis: nil,
              redacted_at: nil

    @type t :: %__MODULE__{
            status: String.t(),
            attempt: integer,
            images: Images.t(),
            extracted_data: ExtractedData.t(),
            analysis: Analysis.t(),
            redacted_at: String.t()
    }

    defmodule Images do
      @moduledoc """
      Images data structure.
      """
      @derive Jason.Encoder
      defstruct original_front: nil,
                original_back: nil,
                cropped_front: nil,
                cropped_back: nil,
                face: nil

      @type t :: %__MODULE__{
              original_front: String.t(),
              original_back: String.t(),
              cropped_front: String.t(),
              cropped_back: String.t(),
              face: String.t()
      }
    end

    defmodule ExtractedData do
      @moduledoc """
      ExtractedData data structure.
      """
      @derive Jason.Encoder
      defstruct id_number: nil,
                category: nil,
                expiration_date: nil,
                issuing_country: nil,
                issuing_region: nil

      @type t :: %__MODULE__{
              id_number: String.t(),
              category: String.t(),
              expiration_date: String.t(),
              issuing_country: String.t(),
              issuing_region: String.t()
      }
    end

    defmodule Analysis do
      @moduledoc """
      Analysis data structure.
      """
      @derive Jason.Encoder
      defstruct authenticity: nil,
                image_quality: nil,
                extracted_data: nil

      @type t :: %__MODULE__{
              authenticity: String.t(),
              image_quality: String.t(),
              extracted_data: ExtractedData.t()
      }

      defmodule ExtractedData do
        @moduledoc """
        ExtractedData data structure.
        """
        @derive Jason.Encoder
        defstruct name: nil,
                  date_of_birth: nil,
                  expiration_date: nil,
                  issuing_country: nil

        @type t :: %__MODULE__{
                name: String.t(),
                date_of_birth: String.t(),
                expiration_date: String.t(),
                issuing_country: String.t()
        }
      end
    end
  end
end
