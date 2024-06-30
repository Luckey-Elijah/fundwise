/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    c.example AS currency_example,\n    o.email AS owner,\n    json_object(\"display_symbol\", c.display_symbol) as currency,\n    -- JSON_ARRAY_LENGTH(c.example) as foo,\n    b.created AS created,\n    b.updated AS updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
  }

  // remove
  collection.schema.removeField("psoifdnk")

  // remove
  collection.schema.removeField("f9vbdslb")

  // remove
  collection.schema.removeField("rmidbsth")

  // remove
  collection.schema.removeField("qjs2uhrl")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "imk7dsmg",
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
    "id": "tbrtxg1e",
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
    "id": "0nzam1eq",
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
    "id": "dpdrr8mh",
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

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ixyzdigd",
    "name": "currency",
    "type": "json",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSize": 1
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    c.example AS currency_example,\n    o.email AS owner,\n    -- JSON_ARRAY_LENGTH(c.example) as foo,\n    b.created AS created,\n    b.updated AS updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
  }

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "psoifdnk",
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
    "id": "f9vbdslb",
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
    "id": "rmidbsth",
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
    "id": "qjs2uhrl",
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
  collection.schema.removeField("imk7dsmg")

  // remove
  collection.schema.removeField("tbrtxg1e")

  // remove
  collection.schema.removeField("0nzam1eq")

  // remove
  collection.schema.removeField("dpdrr8mh")

  // remove
  collection.schema.removeField("ixyzdigd")

  return dao.saveCollection(collection)
})
