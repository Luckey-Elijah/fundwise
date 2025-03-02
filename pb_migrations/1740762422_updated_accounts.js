/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_2324088501")

  // remove field
  collection.fields.removeById("number1921301950")

  // add field
  collection.fields.addAt(5, new Field({
    "hidden": false,
    "id": "select2363381545",
    "maxSelect": 1,
    "name": "type",
    "presentable": false,
    "required": false,
    "system": false,
    "type": "select",
    "values": [
      "cash",
      "credit"
    ]
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_2324088501")

  // add field
  collection.fields.addAt(3, new Field({
    "hidden": false,
    "id": "number1921301950",
    "max": null,
    "min": null,
    "name": "working_balance",
    "onlyInt": false,
    "presentable": true,
    "required": false,
    "system": false,
    "type": "number"
  }))

  // remove field
  collection.fields.removeById("select2363381545")

  return app.save(collection)
})
