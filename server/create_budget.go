package main

import (
	"log"

	"github.com/pocketbase/pocketbase/daos"
	"github.com/pocketbase/pocketbase/models"
)

func CreateBudget(
	dao *daos.Dao,
	budgetName string,
	dateFormatId string,
	ownerId string,
	currencyFormatId string,
	asDefault bool,
) (*models.Record, error) {

	budgetCollection, err := dao.FindCollectionByNameOrId("budgets")

	log.Printf("Creating Budget with budgetName: %v", budgetName)
	log.Printf("Creating Budget with dateFormatId: %v", dateFormatId)
	log.Printf("Creating Budget with currencyFormatId: %v", currencyFormatId)
	log.Printf("Creating Budget with ownerId: %v", ownerId)
	log.Printf("Creating Budget with asDefault: %v", asDefault)

	if err != nil {
		log.Printf("Failed to find budget collection: %v", err)
		return nil, err
	}

	budgetRecord := models.NewRecord(budgetCollection)
	budgetRecord.Set("owner", ownerId)
	budgetRecord.Set("name", budgetName)
	budgetRecord.Set("date_format", dateFormatId)
	budgetRecord.Set("currency_format", currencyFormatId)

	err = dao.SaveRecord(budgetRecord)
	if err != nil {
		log.Printf("Failed to save budget record: %v", err)
		return nil, err
	}

	if asDefault {
		log.Printf("setting %v as default", budgetRecord.Id)
		defaultBudget, err := buildDefaultBudgetRecord(dao, budgetRecord.Id, ownerId)
		if err != nil {
			log.Printf("Failed to create default budget record: %v", err)
			return nil, err
		}

		err = dao.SaveRecord(defaultBudget)
		if err != nil {
			log.Printf("Failed to save default budget record: %v", err)
			return nil, err
		}
	}

	return budgetRecord, nil
}

func buildDefaultBudgetRecord(dao *daos.Dao, budgetId string, ownerId string) (*models.Record, error) {
	defaultBudgetCollection, err := dao.FindCollectionByNameOrId("default_budgets")
	if err != nil {
		log.Printf("Failed to find default_budgets collection: %v", err)
		return nil, err
	}
	defaultBudgetRecord := models.NewRecord(defaultBudgetCollection)
	defaultBudgetRecord.Set("budget", budgetId)
	defaultBudgetRecord.Set("user", ownerId)
	return defaultBudgetRecord, nil
}
