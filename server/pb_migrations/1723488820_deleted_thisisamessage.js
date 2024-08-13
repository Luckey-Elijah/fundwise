/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("wczbc4wsctuwbrm");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "wczbc4wsctuwbrm",
    "created": "2024-08-12 18:45:45.017Z",
    "updated": "2024-08-12 18:48:18.753Z",
    "name": "thisisamessage",
    "type": "view",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "zhfgcckh",
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
        "id": "mmn1nypw",
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
      "query": "SELECT mt.language, mt.translation, (ROW_NUMBER() OVER()) as id\nFROM message_translations mt\nWHERE mt.message = \"a83bgzg0686d2k9\";"
    }
  });

  return Dao(db).saveCollection(collection);
})
