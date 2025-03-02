/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_3292755704")

  // add field
  collection.fields.addAt(2, new Field({
    "hidden": false,
    "id": "bool2287856061",
    "name": "hidden",
    "presentable": false,
    "required": false,
    "system": false,
    "type": "bool"
  }))

  // add field
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

  // update field
  collection.fields.addAt(1, new Field({
    "autogeneratePattern": "",
    "hidden": false,
    "id": "text1579384326",
    "max": 0,
    "min": 0,
    "name": "name",
    "pattern": "",
    "presentable": false,
    "primaryKey": false,
    "required": true,
    "system": false,
    "type": "text"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_3292755704")

  // remove field
  collection.fields.removeById("bool2287856061")

  // remove field
  collection.fields.removeById("relation1945302907")

  // update field
  collection.fields.addAt(1, new Field({
    "autogeneratePattern": "",
    "hidden": false,
    "id": "text1579384326",
    "max": 0,
    "min": 0,
    "name": "name",
    "pattern": "",
    "presentable": false,
    "primaryKey": false,
    "required": false,
    "system": false,
    "type": "text"
  }))

  return app.save(collection)
})
