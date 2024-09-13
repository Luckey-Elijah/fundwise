/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("y9vb4g46oinaaft")

  collection.name = "category_groups"

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("y9vb4g46oinaaft")

  collection.name = "category_group"

  return dao.saveCollection(collection)
})
