/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("0um5egux6ce8rcf")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "lpjhfcmk",
    "name": "message",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "qsbn18duygllakh",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("0um5egux6ce8rcf")

  // remove
  collection.schema.removeField("lpjhfcmk")

  return dao.saveCollection(collection)
})
