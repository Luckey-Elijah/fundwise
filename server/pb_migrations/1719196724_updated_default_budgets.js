/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("81hwnfkc7nxakar")

  collection.indexes = [
    "CREATE UNIQUE INDEX `idx_unique_user` ON `default_budgets` (`user`)"
  ]

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("81hwnfkc7nxakar")

  collection.indexes = []

  return dao.saveCollection(collection)
})
