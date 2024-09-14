package main

import (
	"log"

	"github.com/pocketbase/pocketbase/daos"
	"github.com/pocketbase/pocketbase/models"
)

func CreateCategory(
	dao *daos.Dao,
	groupId string,
	name string,
	hidden bool,
) (*models.Record, error) {
	categoryCollection, err := dao.FindCollectionByNameOrId("categories")
	if err != nil {
		log.Printf("Failed to find categories collection: %v", err)
		return nil, err
	}

	categoryRecord := models.NewRecord(categoryCollection)
	categoryRecord.Set("group", groupId)
	categoryRecord.Set("name", name)
	categoryRecord.Set("hidden", hidden)

	err = dao.SaveRecord(categoryRecord)
	if err != nil {
		log.Printf("Failed to save budget record: %v", err)
		return nil, err
	}

	return categoryRecord, nil
}
