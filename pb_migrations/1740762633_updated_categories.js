/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_3292755704")

  // update field
  collection.fields.addAt(3, new Field({
    "cascadeDelete": true,
    "collectionId": "pbc_1308224162",
    "hidden": false,
    "id": "relation1945302907",
    "maxSelect": 1,
    "minSelect": 0,
    "name": "budget",
    "presentable": false,
    "required": true,
    "system": false,
    "type": "relation"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_3292755704")

  // update field
  collection.fields.addAt(3, new Field({
    "cascadeDelete": false,
    "collectionId": "pbc_1308224162",
    "hidden": false,
    "id": "relation1945302907",
    "maxSelect": 1,
    "minSelect": 0,
    "name": "budget",
    "presentable": false,
    "required": true,
    "system": false,
    "type": "relation"
  }))

  return app.save(collection)
})
