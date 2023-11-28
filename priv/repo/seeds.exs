# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pento.Repo.insert!(%Pento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pento.Catalog

products_data = [
  %{
    name: "SmartDesk Pro",
    description:
      "Adjustable standing desk with built-in wireless charging and voice-controlled assistant.",
    unit_price: 499.99,
    sku: 987_654
  },
  %{
    name: "UltraBook X1",
    description:
      "Thin and lightweight laptop with a 4K display, long battery life, and powerful performance.",
    unit_price: 1299.99,
    sku: 234_567
  },
  %{
    name: "GourmetChef Blender",
    description:
      "High-speed blender for smoothies, soups, and more, featuring multiple speed settings and stainless steel blades.",
    unit_price: 79.99,
    sku: 876_543
  },
  %{
    name: "AdventureX Camping Tent",
    description:
      "Spacious and durable tent for outdoor enthusiasts, with waterproof material and easy setup design.",
    unit_price: 149.99,
    sku: 654_321
  },
  %{
    name: "FitnessTracker Pro",
    description:
      "Advanced fitness tracker with heart rate monitoring, GPS, and water resistance, helping you achieve your health goals.",
    unit_price: 89.99,
    sku: 123_789
  }
]

Enum.each(products_data, fn product ->
  Catalog.create_product(product)
end)
