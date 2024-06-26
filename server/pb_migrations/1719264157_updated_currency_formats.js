/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("j2s5hcp9b3xr640")

  collection.indexes = [
    "CREATE INDEX `pattern_idx` ON `currency_formats` (`pattern`)"
  ]

  // remove
  collection.schema.removeField("hh89bzly")

  // remove
  collection.schema.removeField("q7t3eqif")

  // remove
  collection.schema.removeField("86qrczga")

  // remove
  collection.schema.removeField("p7ujtdhl")

  // remove
  collection.schema.removeField("fx95cq5e")

  // remove
  collection.schema.removeField("on0slo6y")

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
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("j2s5hcp9b3xr640")

  collection.indexes = [
    "CREATE UNIQUE INDEX `idx_wiDQQLT` ON `currency_formats` (\n  `iso_code`,\n  `symbol_first`,\n  `currency_symbol`,\n  `group_separator`,\n  `decimal_separator`,\n  `decimal_digits`\n)"
  ]

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "hh89bzly",
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
    "id": "q7t3eqif",
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
    "id": "86qrczga",
    "name": "symbol_first",
    "type": "bool",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "p7ujtdhl",
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
    "id": "fx95cq5e",
    "name": "currency_symbol",
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
    "id": "on0slo6y",
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
    "name": "iso_code",
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
})
