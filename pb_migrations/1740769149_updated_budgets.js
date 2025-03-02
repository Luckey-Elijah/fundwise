/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_1308224162")

  // update field
  collection.fields.addAt(2, new Field({
    "cascadeDelete": true,
    "collectionId": "_pb_users_auth_",
    "hidden": false,
    "id": "relation2282622326",
    "maxSelect": 1,
    "minSelect": 0,
    "name": "admin",
    "presentable": true,
    "required": true,
    "system": false,
    "type": "relation"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_1308224162")

  // update field
  collection.fields.addAt(2, new Field({
    "cascadeDelete": false,
    "collectionId": "_pb_users_auth_",
    "hidden": false,
    "id": "relation2282622326",
    "maxSelect": 1,
    "minSelect": 0,
    "name": "admin",
    "presentable": true,
    "required": true,
    "system": false,
    "type": "relation"
  }))

  return app.save(collection)
})
