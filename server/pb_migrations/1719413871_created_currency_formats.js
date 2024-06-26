/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "j2s5hcp9b3xr640",
    "created": "2024-06-26 14:57:51.963Z",
    "updated": "2024-06-26 14:57:51.963Z",
    "name": "currency_formats",
    "type": "base",
    "system": false,
    "schema": [
      {
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
      },
      {
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
      },
      {
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
      },
      {
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
      },
      {
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
      },
      {
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
      },
      {
        "system": false,
        "id": "pjeggnyp",
        "name": "display_symbol",
        "type": "bool",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {}
      },
      {
        "system": false,
        "id": "mh0j0rha",
        "name": "symbol_first",
        "type": "bool",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {}
      }
    ],
    "indexes": [
      "CREATE INDEX `currency_idx` ON `currency_formats` (\n  `decimal_digits`,\n  `decimal_separator`,\n  `group_separator`,\n  `symbol`,\n  `group_size`,\n  `symbol_first`,\n  `display_symbol`\n)"
    ],
    "listRule": "",
    "viewRule": "",
    "createRule": "",
    "updateRule": "",
    "deleteRule": "",
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("j2s5hcp9b3xr640");

  return dao.deleteCollection(collection);
})
