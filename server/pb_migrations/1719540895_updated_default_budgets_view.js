/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9q7cv317egnaan7")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    o.id AS owner,\n    json_object(\n      'decimal_digits', c.decimal_digits,\n      'group_size', c.group_size,\n      'decimal_separator', c.decimal_separator,\n      'group_separator', c.group_separator,\n      'symbol', c.symbol,\n      'display_symbol', c.display_symbol,\n      'symbol_first', c.symbol_first\n    ) as currency_format,\n    b.created AS created,\n    b.updated AS updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;"
  }

  // remove
  collection.schema.removeField("o3xwhoht")

  // remove
  collection.schema.removeField("lshczbmt")

  // remove
  collection.schema.removeField("er8pheem")

  // remove
  collection.schema.removeField("v89l02cc")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "r5k2aqq7",
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
    "id": "f88i3j1c",
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
    "id": "dq9zjyj4",
    "name": "owner",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "_pb_users_auth_",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "4pifeqtv",
    "name": "currency_format",
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
  const collection = dao.findCollectionByNameOrId("9q7cv317egnaan7")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    o.email AS owner,\n    json_object(\n      'decimal_digits', c.decimal_digits,\n      'group_size', c.group_size,\n      'decimal_separator', c.decimal_separator,\n      'group_separator', c.group_separator,\n      'symbol', c.symbol,\n      'display_symbol', c.display_symbol,\n      'symbol_first', c.symbol_first\n    ) as currency_format,\n    b.created AS created,\n    b.updated AS updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;"
  }

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "o3xwhoht",
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
    "id": "lshczbmt",
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
    "id": "er8pheem",
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
    "id": "v89l02cc",
    "name": "currency_format",
    "type": "json",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSize": 1
    }
  }))

  // remove
  collection.schema.removeField("r5k2aqq7")

  // remove
  collection.schema.removeField("f88i3j1c")

  // remove
  collection.schema.removeField("dq9zjyj4")

  // remove
  collection.schema.removeField("4pifeqtv")

  return dao.saveCollection(collection)
})
