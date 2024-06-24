/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "l7f5m07fb2z7khf",
    "created": "2024-06-18 17:06:16.566Z",
    "updated": "2024-06-18 17:06:16.566Z",
    "name": "date_formats",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "qycjoov2",
        "name": "description",
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
        "id": "juj9h45o",
        "name": "format",
        "type": "text",
        "required": true,
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
  const collection = dao.findCollectionByNameOrId("l7f5m07fb2z7khf");

  return dao.deleteCollection(collection);
})
