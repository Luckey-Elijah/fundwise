/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    c.id AS currency,\n    o.email AS owner,\n    b.created,\n    b.updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format= df.id\n    RIGHT JOIN currency_formats c ON b.id = c.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
  }

  // remove
  collection.schema.removeField("2tcwztsy")

  // remove
  collection.schema.removeField("bugyqfyr")

  // remove
  collection.schema.removeField("vkdx9o3m")

  // remove
  collection.schema.removeField("zerbninr")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "q10tpucg",
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
    "id": "6zwy9dox",
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
    "id": "6vyyhred",
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
    "id": "nnjmnhjw",
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
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    c.id AS currency,\n    o.email AS owner,\n    b.created,\n    b.updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format= df.id\n    LEFT JOIN currency_formats c ON b.id = c.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
  }

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "2tcwztsy",
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
    "id": "bugyqfyr",
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
    "id": "vkdx9o3m",
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
    "id": "zerbninr",
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
  collection.schema.removeField("q10tpucg")

  // remove
  collection.schema.removeField("6zwy9dox")

  // remove
  collection.schema.removeField("6vyyhred")

  // remove
  collection.schema.removeField("nnjmnhjw")

  return dao.saveCollection(collection)
})
