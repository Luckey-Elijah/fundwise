/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    c.id AS currency,\n    o.email AS owner,\n    b.created,\n    b.updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
  }

  // remove
  collection.schema.removeField("ysgbf0iz")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "nbicvxkk",
    "name": "name",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "p9jn4vnk",
    "name": "date_format",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "75vqpx05",
    "name": "currency",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "j2s5hcp9b3xr640",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ddakyyqi",
    "name": "owner",
    "type": "email",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "exceptDomains": null,
      "onlyDomains": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    c.example_format AS example_currency\nFROM\n    budgets b\n    LEFT JOIN currency_formats c ON b.currency_format = c.id;\n"
  }

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

  // remove
  collection.schema.removeField("nbicvxkk")

  // remove
  collection.schema.removeField("p9jn4vnk")

  // remove
  collection.schema.removeField("75vqpx05")

  // remove
  collection.schema.removeField("ddakyyqi")

  return dao.saveCollection(collection)
})
