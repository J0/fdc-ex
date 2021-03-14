defmodule FdcEx do
  @moduledoc """
  Documentation for `FdcEx`.
  """
  @moduledoc since: "0.1.0"
  @base_url "https://api.nal.usda.gov/fdc/v1/"

  # TODO: [Add options(e.g. format, nutrients) for API methods](Joel) -- 14/03/21

  @spec fetch_one(any, any, any) ::
          {:error, HTTPoison.Error.t()}
          | {:ok,
             %{
               :__struct__ => HTTPoison.AsyncResponse | HTTPoison.Response,
               optional(:body) => any,
               optional(:headers) => list,
               optional(:id) => reference,
               optional(:request) => HTTPoison.Request.t(),
               optional(:request_url) => any,
               optional(:status_code) => integer
             }}
  @doc """
  Fetches details for one food item by FDC ID
  """
  def fetch_one(fdc_id, format \\ "full", nutrients \\ []) do
    HTTPoison.get(@base_url <> "food/#{fdc_id}" <> "?api_key=DEMO_KEY")
  end

  @doc """
  Fetches details for multiple food items using input FDC IDs
  """
  def fetch_many(fdc_ids, format \\ "full", nutrients \\ []) do
    # Todo: [Check for empty list case] (Joel) -- 14/03/21
    fdc_ids = Enum.join(fdc_ids, ",")
    HTTPoison.get(@base_url <> "foods/" <> "?api_key=DEMO_KEY" <> "&fdcIds=#{fdc_ids}")
  end

  @doc """
  Returns a paged list of foods, in the 'abridged' format
  """
  def fetch_pages(
        data_type \\ [],
        page_size \\ 50,
        page_number \\ 1,
        sort_by \\ "",
        sort_order \\ ""
      ) do
  end

  @spec search(any, any, any, any, any, any) :: :results
  @doc """
  Returns a list of foods that matched search (query) keywords
  """
  def search(
        query,
        data_type \\ [],
        page_size \\ 50,
        sort_by \\ "",
        sort_order \\ "",
        brand_owner \\ ""
      ) do
    HTTPoison.get(@base_url <> "/foods/search" <> "?api_key=DEMO_KEY" <> "&query=#{query}")
  end

  @spec get_spec(:json | :yaml) :: %{
          :__struct__ => HTTPoison.AsyncResponse | HTTPoison.Response,
          optional(:body) => any,
          optional(:headers) => list,
          optional(:id) => reference,
          optional(:request) => HTTPoison.Request.t(),
          optional(:request_url) => any,
          optional(:status_code) => integer
        }
  def get_spec(type \\ :yaml) do
    case type do
      :yaml ->
        HTTPoison.get(@base_url <> "yaml-spec" <> "?api_key=DEMO_KEY")

      :json ->
        HTTPoison.get(@base_url <> "json-spec" <> "?api_key=DEMO_KEY")
        # Return json or yaml spec
    end
  end
end
