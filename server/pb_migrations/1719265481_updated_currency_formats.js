/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("j2s5hcp9b3xr640")

  collection.indexes = [
    "CREATE INDEX `currency_idx` ON `currency_formats` (\n  `decimal_digits`,\n  `decimal_separator`,\n  `group_separator`,\n  `symbol`,\n  `group_size`\n)"
  ]

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("j2s5hcp9b3xr640")

  collection.indexes = []

  return dao.saveCollection(collection)
})
