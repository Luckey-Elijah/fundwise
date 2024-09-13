/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("y9vb4g46oinaaft")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "yfkusmiy",
    "name": "hidden",
    "type": "bool",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("y9vb4g46oinaaft")

  // remove
  collection.schema.removeField("yfkusmiy")

  return dao.saveCollection(collection)
})
