/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("a2hzh5vtcdb5720")

  collection.name = "budget_accounts"

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("a2hzh5vtcdb5720")

  collection.name = "accounts"

  return dao.saveCollection(collection)
})
