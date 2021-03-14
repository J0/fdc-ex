# FdcEx

This is the client library for the [Food Data Central API](https://fdc.nal.usda.gov/api-spec/fdc_api.html#/FDC/getFoods) which is part of the [Open Gov Data](data.gov) platform.
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fdc_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fdc_ex, "~> 0.1.0"}
  ]
end
```

## Example Usage

### Fetch One

```
FdcEx.fetch_one(1104067)
```
### Fetch Many

```
FdcEx.fetch_many([1104067,1104086,1104087])
```

### Search for item by name
```
FdcEx.search("Cheddar Cheese")
```

### Get API Spec
```
FdcEx.get_spec(:json)
```
Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/fdc_ex](https://hexdocs.pm/fdc_ex).

