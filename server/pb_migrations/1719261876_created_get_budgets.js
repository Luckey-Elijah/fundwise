/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "r5gc09oyr8nxfkl",
    "created": "2024-06-24 20:44:36.093Z",
    "updated": "2024-06-24 20:44:36.093Z",
    "name": "get_budgets",
    "type": "view",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "rwn3dt9n",
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
        "id": "zfcy6v5i",
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
        "id": "4wit3ox7",
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
      },
      {
        "system": false,
        "id": "wlx0baej",
        "name": "owner",
        "type": "email",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "exceptDomains": null,
          "onlyDomains": null
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
      "query": "SELECT\n    b.id as id,\n    b.name as name,\n    df.format AS date_format,\n    c.example_format AS currency,\n    o.email AS owner,\n    b.created,\n    b.updated\nFROM\n    budgets b\n    LEFT JOIN date_formats df ON b.date_format = df.id\n    LEFT JOIN currency_formats c ON b.id = c.id\n    LEFT JOIN users o ON b.owner = o.id;\n"
    }
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("r5gc09oyr8nxfkl");

  return dao.deleteCollection(collection);
})
