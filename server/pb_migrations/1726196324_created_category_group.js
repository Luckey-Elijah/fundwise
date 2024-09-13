/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "y9vb4g46oinaaft",
    "created": "2024-09-13 02:58:44.912Z",
    "updated": "2024-09-13 02:58:44.912Z",
    "name": "category_group",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "qn1unzhm",
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
        "id": "zex2duq1",
        "name": "name",
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
  const collection = dao.findCollectionByNameOrId("y9vb4g46oinaaft");

  return dao.deleteCollection(collection);
})
