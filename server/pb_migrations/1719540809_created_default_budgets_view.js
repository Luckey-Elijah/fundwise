/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "9q7cv317egnaan7",
    "created": "2024-06-28 02:13:29.568Z",
    "updated": "2024-06-28 02:13:29.568Z",
    "name": "default_budgets_view",
    "type": "view",
    "system": false,
    "schema": [
      {
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
      },
      {
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
      },
      {
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
      },
      {
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
      }
    ],
    "indexes": [],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {
      "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    o.email AS owner,\n    json_object(\n      'decimal_digits', c.decimal_digits,\n      'group_size', c.group_size,\n      'decimal_separator', c.decimal_separator,\n      'group_separator', c.group_separator,\n      'symbol', c.symbol,\n      'display_symbol', c.display_symbol,\n      'symbol_first', c.symbol_first\n    ) as currency_format,\n    b.created AS created,\n    b.updated AS updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.currency_format = c.id\n    LEFT JOIN users o ON b.owner = o.id;"
    }
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("9q7cv317egnaan7");

  return dao.deleteCollection(collection);
})
