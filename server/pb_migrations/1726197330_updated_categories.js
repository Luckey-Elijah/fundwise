/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("ijws87n5f7gur1q")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "dnlfa6bh",
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
  const collection = dao.findCollectionByNameOrId("ijws87n5f7gur1q")

  // remove
  collection.schema.removeField("dnlfa6bh")

  return dao.saveCollection(collection)
})
