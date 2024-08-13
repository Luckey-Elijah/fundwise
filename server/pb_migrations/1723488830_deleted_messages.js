/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("qsbn18duygllakh");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "qsbn18duygllakh",
    "created": "2024-08-12 18:36:23.284Z",
    "updated": "2024-08-12 18:36:23.284Z",
    "name": "messages",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "mseooyyp",
        "name": "message",
        "type": "text",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      }
    ],
    "indexes": [
      "CREATE UNIQUE INDEX `idx_flwaPEw` ON `messages` (`message`)"
    ],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
})
