/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_3174063690")

  // add field
  collection.fields.addAt(8, new Field({
    "cascadeDelete": false,
    "collectionId": "pbc_2886183428",
    "hidden": false,
    "id": "relation1896815203",
    "maxSelect": 999,
    "minSelect": 0,
    "name": "splits",
    "presentable": false,
    "required": false,
    "system": false,
    "type": "relation"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_3174063690")

  // remove field
  collection.fields.removeById("relation1896815203")

  return app.save(collection)
})
