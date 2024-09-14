package main

import (
	"log"

	"github.com/pocketbase/pocketbase"
	"github.com/pocketbase/pocketbase/core"
	"github.com/pocketbase/pocketbase/daos"
)

func OnUserCreated(e *core.RecordCreateEvent, app *pocketbase.PocketBase) error {
	dao := app.Dao()

	dateFormatId, err := getDateFormat(dao)
	if err != nil {
		log.Printf("Failed to find date_formats collection: %v", err)
		return err
	}

	currencyFormat, err := getCurrencyFormat(dao)
	if err != nil {
		log.Printf("Failed get currency_format from collection: %v", err)
		return err
	}

	budget, err := CreateBudget(dao, "My Budget", *dateFormatId, e.Record.Id, *currencyFormat, true)

	if err != nil {
		log.Printf("Failed to create budget record: %v", err)
		return err
	}

	group, err := CreateCategoryGroup(dao, budget.Id, "Necessities")
	if err != nil {
		log.Printf("Failed to create category group record: %v", err)
		return err
	} else {
		log.Printf("Created category group record: %v", group)
	}

	category, err := CreateCategory(dao, group.Id, "Groceries", false)
	if err != nil {
		log.Printf("Failed to create category record: %v", err)
		return err
	} else {
		log.Printf("Created category record: %v", category)
	}

	budgetAccount, err := CreateBudgetAccount(dao, budget.Id, "Checking Account", "checking", true, false, 1000_00)
	if err != nil {
		log.Printf("Failed to create budget account record: %v", err)
	} else {
		log.Printf("Created budget account record: %v", budgetAccount)
	}

	return nil
}

func getCurrencyFormat(dao *daos.Dao) (*string, error) {
	currencyFormatCollection, err := dao.FindCollectionByNameOrId("currency_formats")
	if err != nil {
		log.Printf("Failed to find currency_formats collection: %v", err)
		return nil, err
	}

	currencyFormatRecords, err := dao.FindRecordsByExpr(currencyFormatCollection.Id, nil)

	if err != nil {
		log.Printf("Failed to find currency_formats records: %v", err)
		return nil, err
	}

	firstCurrencyFormatRecord := currencyFormatRecords[0]
	currencyFormatId := firstCurrencyFormatRecord.Id
	return &currencyFormatId, nil
}

func getDateFormat(dao *daos.Dao) (*string, error) {
	dateFormatCollection, err := dao.FindCollectionByNameOrId("date_formats")
	if err != nil {
		log.Printf("Failed to find date_formats collection: %v", err)
		return nil, err
	}

	dateFormatRecords, err := dao.FindRecordsByExpr(dateFormatCollection.Id, nil)

	if err != nil {
		log.Printf("Failed to find date_formats records: %v", err)
		return nil, err
	}

	firstDateFormatRecord := dateFormatRecords[0]
	dateFormatId := firstDateFormatRecord.Id
	return &dateFormatId, nil
}
