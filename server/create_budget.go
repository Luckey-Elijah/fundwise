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
	currentFormatId string,
	ownerId string,
	asDefault bool,
) (*models.Record, error) {
	budget, err := buildBudgetRecord(dao, dateFormatId, ownerId, currentFormatId)
	if err != nil {
		log.Printf("Failed to create budget record: %v", err)
		return nil, err
	}

	err = dao.SaveRecord(budget)
	if err != nil {
		log.Printf("Failed to save budget record: %v", err)
		return nil, err
	}

	if asDefault {
		defaultBudget, err := buildDefaultBudgetRecord(dao, budget.Id, ownerId)
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

	return budget, nil
}

func buildBudgetRecord(
	dao *daos.Dao,
	dateFormatId string,
	ownerId string,
	currencyFormatId string,
) (*models.Record, error) {
	budgetCollection, err := dao.FindCollectionByNameOrId("budgets")

	if err != nil {
		log.Printf("Failed to find budget collection: %v", err)
		return nil, err
	}

	budgetRecord := models.NewRecord(budgetCollection)

	budgetRecord.Set("owner", ownerId)
	budgetRecord.Set("name", "My Budget")
	budgetRecord.Set("date_format", dateFormatId)
	budgetRecord.Set("currency_format", currencyFormatId)

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
