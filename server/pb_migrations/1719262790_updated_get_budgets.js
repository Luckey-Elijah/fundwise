/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    c.example_format AS example_currency\nFROM\n    budgets b\n    LEFT JOIN currency_formats c ON b.currency_format = c.id;\n"
  }

  // remove
  collection.schema.removeField("aojkdyaa")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ysgbf0iz",
    "name": "example_currency",
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
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    c.example_format AS example_currency\nFROM\n    budgets b\n    LEFT JOIN currency_formats c ON b.id = c.id;\n"
  }

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "aojkdyaa",
    "name": "example_currency",
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

  // remove
  collection.schema.removeField("ysgbf0iz")

  return dao.saveCollection(collection)
})
