/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("woxzl28pdcvroou")

  collection.listRule = ""

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("woxzl28pdcvroou")

  collection.listRule = "@request.auth.id = owner.id"

  return dao.saveCollection(collection)
})
