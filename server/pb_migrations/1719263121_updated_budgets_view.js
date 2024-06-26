/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    c.example_format AS currency_example,\n    o.email AS owner,\n    b.created,\n    b.updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
  }

  // remove
  collection.schema.removeField("i5d16fwm")

  // remove
  collection.schema.removeField("pwpeiz4c")

  // remove
  collection.schema.removeField("zkhtrbgx")

  // remove
  collection.schema.removeField("skylwx6p")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "nlnex4ht",
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
    "id": "5ngwlcay",
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
    "id": "sxwobr2a",
    "name": "currency_example",
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

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "q8qaeibv",
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
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    c.example_format AS currency,\n    o.email AS owner,\n    b.created,\n    b.updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
  }

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "i5d16fwm",
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
    "id": "pwpeiz4c",
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
    "id": "zkhtrbgx",
    "name": "currency",
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

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "skylwx6p",
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

  // remove
  collection.schema.removeField("nlnex4ht")

  // remove
  collection.schema.removeField("5ngwlcay")

  // remove
  collection.schema.removeField("sxwobr2a")

  // remove
  collection.schema.removeField("q8qaeibv")

  return dao.saveCollection(collection)
})
