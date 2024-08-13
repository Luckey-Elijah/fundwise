/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "wczbc4wsctuwbrm",
    "created": "2024-08-12 18:45:45.017Z",
    "updated": "2024-08-12 18:45:45.017Z",
    "name": "messages_en",
    "type": "view",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "gnfxvvrm",
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
        "id": "dz7dvbqn",
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
    "options": {
      "query": "SELECT \n    mt.language,\n    mt.translation,\n    (ROW_NUMBER() OVER()) as id\nFROM \n    message_translations mt\nWHERE \n    mt.message = 0;"
    }
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("wczbc4wsctuwbrm");

  return dao.deleteCollection(collection);
})
