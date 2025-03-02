/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_1308224162")

  // add field
  collection.fields.addAt(3, new Field({
    "hidden": false,
    "id": "select2363381545",
    "maxSelect": 1,
    "name": "type",
    "presentable": false,
    "required": true,
    "system": false,
    "type": "select",
    "values": [
      "cash",
      "credit"
    ]
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_1308224162")

  // remove field
  collection.fields.removeById("select2363381545")

  return app.save(collection)
})
