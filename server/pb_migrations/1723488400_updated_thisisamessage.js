/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("wczbc4wsctuwbrm")

  collection.options = {
    "query": "SELECT \n    mt.language,\n    mt.translation,\n    (ROW_NUMBER() OVER()) as id\nFROM \n    message_translations mt\nWHERE \n    mt.message = \"a83bgzg0686d2k9\";"
  }

  // remove
  collection.schema.removeField("cy6ysmdc")

  // remove
  collection.schema.removeField("zrxmluyu")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "9dsevaoj",
    "name": "language",
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
    "id": "fwidgayy",
    "name": "translation",
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
  const collection = dao.findCollectionByNameOrId("wczbc4wsctuwbrm")

  collection.options = {
    "query": "SELECT \n    mt.language,\n    mt.translation,\n    (ROW_NUMBER() OVER()) as id\nFROM \n    message_translations mt\nWHERE \n    mt.language = 0;"
  }

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "cy6ysmdc",
    "name": "language",
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
    "id": "zrxmluyu",
    "name": "translation",
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
  collection.schema.removeField("9dsevaoj")

  // remove
  collection.schema.removeField("fwidgayy")

  return dao.saveCollection(collection)
})
