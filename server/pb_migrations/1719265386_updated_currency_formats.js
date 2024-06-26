/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("j2s5hcp9b3xr640")

  collection.indexes = []

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "odzqusvl",
    "name": "decimal_digits",
    "type": "number",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 0,
      "max": null,
      "noDecimal": true
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "s4yzc7cb",
    "name": "decimal_separator",
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
    "id": "24kpetwz",
    "name": "group_separator",
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
    "id": "aupvo6be",
    "name": "symbol",
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
    "id": "gblukj8c",
    "name": "group_size",
    "type": "number",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "noDecimal": true
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "pjeggnyp",
    "name": "display_symbol",
    "type": "bool",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "59ikpqys",
    "name": "example",
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
  const collection = dao.findCollectionByNameOrId("j2s5hcp9b3xr640")

  collection.indexes = [
    "CREATE INDEX `pattern_idx` ON `currency_formats` (`pattern`)"
  ]

  // remove
  collection.schema.removeField("odzqusvl")

  // remove
  collection.schema.removeField("s4yzc7cb")

  // remove
  collection.schema.removeField("24kpetwz")

  // remove
  collection.schema.removeField("aupvo6be")

  // remove
  collection.schema.removeField("gblukj8c")

  // remove
  collection.schema.removeField("pjeggnyp")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "59ikpqys",
    "name": "pattern",
    "type": "text",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
})
