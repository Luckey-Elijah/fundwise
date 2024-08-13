/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "0um5egux6ce8rcf",
    "created": "2024-08-12 18:36:48.057Z",
    "updated": "2024-08-12 18:36:48.057Z",
    "name": "message_translations",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "mpkl0csu",
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
      },
      {
        "system": false,
        "id": "bq1nfjat",
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
      }
    ],
    "indexes": [],
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
  const collection = dao.findCollectionByNameOrId("0um5egux6ce8rcf");

  return dao.deleteCollection(collection);
})
