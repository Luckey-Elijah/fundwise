/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("9q7cv317egnaan7")

  collection.options = {
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    o.id AS owner,\n    json_object(\n      'decimal_digits', c.decimal_digits,\n      'group_size', c.group_size,\n      'decimal_separator', c.decimal_separator,\n      'group_separator', c.group_separator,\n      'symbol', c.symbol,\n      'display_symbol', c.display_symbol,\n      'symbol_first', c.symbol_first\n    ) as currency_format,\n    b.created AS created,\n    b.updated AS updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;"
  }

  // remove
  collection.schema.removeField("erlllij0")

  // remove
  collection.schema.removeField("3qvjamod")

  // remove
  collection.schema.removeField("p625ixy9")

  // remove
  collection.schema.removeField("co5sa9uc")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "zughc8as",
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
    "id": "pdkhg2op",
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
    "id": "zgz7vt7o",
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
    "id": "xlkprl0a",
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
    "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    o.id AS user,\n    json_object(\n      'decimal_digits', c.decimal_digits,\n      'group_size', c.group_size,\n      'decimal_separator', c.decimal_separator,\n      'group_separator', c.group_separator,\n      'symbol', c.symbol,\n      'display_symbol', c.display_symbol,\n      'symbol_first', c.symbol_first\n    ) as currency_format,\n    b.created AS created,\n    b.updated AS updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;"
  }

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "erlllij0",
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
    "id": "3qvjamod",
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
    "id": "p625ixy9",
    "name": "user",
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
    "id": "co5sa9uc",
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
  collection.schema.removeField("zughc8as")

  // remove
  collection.schema.removeField("pdkhg2op")

  // remove
  collection.schema.removeField("zgz7vt7o")

  // remove
  collection.schema.removeField("xlkprl0a")

  return dao.saveCollection(collection)
})
