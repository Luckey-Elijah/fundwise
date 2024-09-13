package main

import (
	"log"

	"github.com/pocketbase/pocketbase"
	"github.com/pocketbase/pocketbase/core"
	"github.com/pocketbase/pocketbase/models"
)

func OnUserCreated(e *core.RecordCreateEvent, app *pocketbase.PocketBase) error {
	dateFormatId, err:=	getDateFormat(app)
	if err != nil {
		log.Printf("Failed to find date_formats collection: %v", err)
		return err
	}

	currencyFormat, err := getCurrencyFormat(app)
	if err != nil {
		log.Printf("Failed get currency_format from collection: %v", err)
		return err
	}

	budget, err := buildBudgetRecord(app, *dateFormatId, e.Record.Id, *currencyFormat)
	if err !=nil {
		log.Printf("Failed to create budget record: %v", err)
		return err
	}

	err = app.Dao().SaveRecord(budget)
	if err != nil {
		log.Printf("Failed to save budget record: %v", err)
		return err
	}

	group, err := buildCategoryGroupRecord(app, budget.Id, "Necessary")
	if err !=nil {
		log.Printf("Failed to create budget record: %v", err)
		return err
	}

	err = app.Dao().SaveRecord(group)
	if err != nil {
		log.Printf("Failed to save budget record: %v", err)
		return err
	}

	category, err := buildCategoryRecord(app, group.Id, "Groceries")
	if err !=nil {
		log.Printf("Failed to create budget record: %v", err)
		return err
	}

	err = app.Dao().SaveRecord(category)
	if err != nil {
		log.Printf("Failed to save budget record: %v", err)
		return err
	}

	return nil;
}

func buildCategoryRecord(app *pocketbase.PocketBase, groupId string, name string) (*models.Record,error) {
	categoryCollection, err := app.Dao().FindCollectionByNameOrId("categories")

	if err != nil {
		log.Printf("Failed to find categories collection: %v", err)
		return nil, err;
	}

	categoryRecord := models.NewRecord(categoryCollection)
	categoryRecord.Set("group", groupId)
	categoryRecord.Set("name", name)
	categoryRecord.Set("hidden", false)

	return categoryRecord, nil;
}

func buildCategoryGroupRecord(app *pocketbase.PocketBase, budgetId string, name string) (*models.Record,error) {
	categoryGroupCollection, err := app.Dao().FindCollectionByNameOrId("category_groups")

	if err != nil {
		log.Printf("Failed to find category_groups collection: %v", err)
		return nil, err
	}

	log.Printf(">>> budget: %v", budgetId)
	categoryGroupRecord := models.NewRecord(categoryGroupCollection)
	categoryGroupRecord.Set("budget", budgetId)
	categoryGroupRecord.Set("name", name)
	categoryGroupRecord.Set("hidden", false)
	return categoryGroupRecord, nil;
}

func getCurrencyFormat(app *pocketbase.PocketBase) (*string, error) {
	currencyFormatCollection, err := app.Dao().FindCollectionByNameOrId("currency_formats")
	if err != nil {
		log.Printf("Failed to find currency_formats collection: %v", err)
		return nil, err
	}

	currencyFormatRecords, err := app.Dao().FindRecordsByExpr(currencyFormatCollection.Id, nil)

	if err != nil {
		log.Printf("Failed to find currency_formats records: %v", err)
		return nil, err
	}

	firstCurrencyFormatRecord := currencyFormatRecords[0]
	currencyFormatId := firstCurrencyFormatRecord.Id
	return &currencyFormatId, nil;
}

func getDateFormat(app *pocketbase.PocketBase) (*string, error) {
	dateFormatCollection, err := app.Dao().FindCollectionByNameOrId("date_formats")
	if err != nil {
		log.Printf("Failed to find date_formats collection: %v", err)
		return nil, err
	}

	dateFormatRecords, err := app.Dao().FindRecordsByExpr(dateFormatCollection.Id, nil)

	if err != nil {
		log.Printf("Failed to find date_formats records: %v", err)
		return nil, err
	}

	firstDateFormatRecord := dateFormatRecords[0]
	dateFormatId := firstDateFormatRecord.Id
	return &dateFormatId, nil;
}

func buildBudgetRecord(
	app *pocketbase.PocketBase,
	dateFormatId string,
	ownerId string,
	currencyFormatId string,
) (*models.Record,error) {
	budgetCollection, err := app.Dao().FindCollectionByNameOrId("budgets")

	if err != nil {
		log.Printf("Failed to find budget collection: %v", err)
		return nil, err
	}

	budgetRecord := models.NewRecord(budgetCollection)

	budgetRecord.Set("owner", ownerId)
	budgetRecord.Set("name", "My Budget")
	budgetRecord.Set("date_format", dateFormatId)
	budgetRecord.Set("currency_format", currencyFormatId)

	return budgetRecord, nil;
}

