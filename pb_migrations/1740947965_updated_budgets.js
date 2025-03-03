/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_1308224162")

  // update collection data
  unmarshal({
    "createRule": "",
    "listRule": "@request.auth.id = admin.id",
    "updateRule": "@request.auth.id = admin.id",
    "viewRule": "@request.auth.id = admin.id"
  }, collection)

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_1308224162")

  // update collection data
  unmarshal({
    "createRule": null,
    "listRule": null,
    "updateRule": null,
    "viewRule": null
  }, collection)

  return app.save(collection)
})
