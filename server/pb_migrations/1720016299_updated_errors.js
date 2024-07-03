/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("3t52cy31k9ae0x4")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ovi2wr4p",
    "name": "runtime_type",
    "type": "text",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("3t52cy31k9ae0x4")

  // remove
  collection.schema.removeField("ovi2wr4p")

  return dao.saveCollection(collection)
})
