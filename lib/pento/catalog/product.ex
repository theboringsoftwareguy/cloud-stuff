defmodule Pento.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :unit_price, :float
    field :sku, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :unit_price, :sku])
    |> validate_required([:name, :description, :unit_price, :sku])
    |> unique_constraint(:sku)
    |> validate_number(:unit_price, greater_than: 0)
  end

  @doc false
  def markdown_changeset(product, attrs) do
    product
    |> changeset(attrs)
    |> validate_markdown(:unit_price, product.unit_price)
  end

  @doc false
  defp validate_markdown(changeset, :unit_price, current_price) do
    case get_change(changeset, :unit_price) do
      %Ecto.Changeset{valid?: true, changes: %{unit_price: new_price}} ->
        if new_price < current_price do
          changeset
        else
          add_error(changeset, :unit_price, "must be greater than current price")
        end

      _ ->
        changeset
    end
  end
end
