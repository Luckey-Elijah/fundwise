/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    c.example_format AS currency, \n    o.email AS owner,\n    b.created,\n    b.updated\nFROM\n    budgets b\n    LEFT JOIN currency_formats c ON b.id = c.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
  }

  // remove
  collection.schema.removeField("npbwcecv")

  // remove
  collection.schema.removeField("kwofg0jn")

  // remove
  collection.schema.removeField("stkbp5yy")

  // remove
  collection.schema.removeField("tojqfqrr")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "tnyiqkll",
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
    "id": "wu4hxcte",
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
    "id": "v0hllwgc",
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
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    currency_formats.id AS currency, \n    o.email AS owner,\n    b.created,\n    b.updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format= df.id\n    LEFT JOIN currency_formats currency_formats ON b.id = currency_formats.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
  }

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "npbwcecv",
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
    "id": "kwofg0jn",
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
    "id": "stkbp5yy",
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
    "id": "tojqfqrr",
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
  collection.schema.removeField("tnyiqkll")

  // remove
  collection.schema.removeField("wu4hxcte")

  // remove
  collection.schema.removeField("v0hllwgc")

  return dao.saveCollection(collection)
})
