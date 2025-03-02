/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_3174063690")

  // update collection data
  unmarshal({
    "indexes": [
      "CREATE INDEX `idx_category_or_splits`\n  ON `transactions` (`category`, `splits`)\n  WHERE `category` IS NULL OR `splits` IS NULL;\n"
    ]
  }, collection)

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_3174063690")

  // update collection data
  unmarshal({
    "indexes": []
  }, collection)

  return app.save(collection)
})
