package main

import (
	"log"

	"github.com/pocketbase/pocketbase/daos"
	"github.com/pocketbase/pocketbase/models"
)

func CreateCategoryGroup(dao *daos.Dao, budgetId string, name string) (*models.Record, error) {
	categoryGroupCollection, err := dao.FindCollectionByNameOrId("category_groups")

	if err != nil {
		log.Printf("Failed to find category_groups collection: %v", err)
		return nil, err
	}
	categoryGroupRecord := models.NewRecord(categoryGroupCollection)
	categoryGroupRecord.Set("budget", budgetId)
	categoryGroupRecord.Set("name", name)
	categoryGroupRecord.Set("hidden", false)

	err = dao.SaveRecord(categoryGroupRecord)

	if err != nil {
		log.Printf("Failed to save category group record: %v", err)
		return nil, err
	}

	return categoryGroupRecord, nil
}
