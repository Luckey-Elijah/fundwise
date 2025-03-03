/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_1308224162")

  // update collection data
  unmarshal({
    "indexes": [
      "CREATE INDEX `idx_7fn2quG1jK` ON `budgets` (\n  `name`,\n  `admin`\n)"
    ]
  }, collection)

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_1308224162")

  // update collection data
  unmarshal({
    "indexes": []
  }, collection)

  return app.save(collection)
})
