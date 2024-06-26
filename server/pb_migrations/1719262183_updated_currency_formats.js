/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("j2s5hcp9b3xr640")

  collection.indexes = [
    "CREATE UNIQUE INDEX `idx_wiDQQLT` ON `currency_formats` (\n  `iso_code`,\n  `symbol_first`,\n  `currency_symbol`,\n  `group_separator`,\n  `decimal_separator`,\n  `decimal_digits`\n)"
  ]

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("j2s5hcp9b3xr640")

  collection.indexes = []

  return dao.saveCollection(collection)
})
