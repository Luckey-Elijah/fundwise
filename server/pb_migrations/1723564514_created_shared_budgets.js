/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "n4mxo3av2veywrd",
    "created": "2024-08-13 15:55:14.329Z",
    "updated": "2024-08-13 15:55:14.329Z",
    "name": "shared_budgets",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "x6zsjker",
        "name": "budget",
        "type": "relation",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "collectionId": "woxzl28pdcvroou",
          "cascadeDelete": false,
          "minSelect": null,
          "maxSelect": 1,
          "displayFields": null
        }
      },
      {
        "system": false,
        "id": "bazrlz40",
        "name": "with",
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
      }
    ],
    "indexes": [
      "CREATE INDEX `idx_yX1gjGu` ON `shared_budgets` (\n  `budget`,\n  `with`\n)"
    ],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("n4mxo3av2veywrd");

  return dao.deleteCollection(collection);
})
