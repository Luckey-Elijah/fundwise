package main

import (
	"log"

	"github.com/pocketbase/pocketbase"
	"github.com/pocketbase/pocketbase/core"
	"github.com/pocketbase/pocketbase/daos"
	"github.com/pocketbase/pocketbase/models"
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

	group, err := buildCategoryGroupRecord(dao, budget.Id, "Necessary")
	if err != nil {
		log.Printf("Failed to create category group record: %v", err)
		return err
	}

	err = dao.SaveRecord(group)
	if err != nil {
		log.Printf("Failed to save category group record: %v", err)
		return err
	}

	category, err := buildCategoryRecord(dao, group.Id, "Groceries")
	if err != nil {
		log.Printf("Failed to create budget record: %v", err)
		return err
	}

	err = dao.SaveRecord(category)
	if err != nil {
		log.Printf("Failed to save budget record: %v", err)
		return err
	}

	budgetAccount, err := buildBudgetAccountRecord(dao, budget.Id)
	if err != nil {
		log.Printf("Failed to create budget account record: %v", err)
	}

	err = dao.SaveRecord(budgetAccount)
	if err != nil {
		log.Printf("Failed to save budget account record: %v", err)
		return err
	}

	return nil
}

func buildBudgetAccountRecord(dao *daos.Dao, budgetId string) (*models.Record, error) {
	budgetAccountCollection, err := dao.FindCollectionByNameOrId("budget_accounts")
	if err != nil {
		log.Printf("Failed to find budget_accounts collection: %v", err)
		return nil, err
	}
	budgetAccountRecord := models.NewRecord(budgetAccountCollection)
	budgetAccountRecord.Set("name", "My Checking Account")
	budgetAccountRecord.Set("account_type", "checking")
	budgetAccountRecord.Set("on_budget", "true")
	budgetAccountRecord.Set("closed", "false")
	budgetAccountRecord.Set("cleared_balance", 1000_00)
	budgetAccountRecord.Set("cleared_balance", 1000_00)
	budgetAccountRecord.Set("budget", budgetId)

	return budgetAccountRecord, nil
}

func buildCategoryRecord(dao *daos.Dao, groupId string, name string) (*models.Record, error) {
	categoryCollection, err := dao.FindCollectionByNameOrId("categories")

	if err != nil {
		log.Printf("Failed to find categories collection: %v", err)
		return nil, err
	}

	categoryRecord := models.NewRecord(categoryCollection)
	categoryRecord.Set("group", groupId)
	categoryRecord.Set("name", name)
	categoryRecord.Set("hidden", false)

	return categoryRecord, nil
}

func buildCategoryGroupRecord(dao *daos.Dao, budgetId string, name string) (*models.Record, error) {
	categoryGroupCollection, err := dao.FindCollectionByNameOrId("category_groups")

	if err != nil {
		log.Printf("Failed to find category_groups collection: %v", err)
		return nil, err
	}

	log.Printf(">>> budget: %v", budgetId)
	categoryGroupRecord := models.NewRecord(categoryGroupCollection)
	categoryGroupRecord.Set("budget", budgetId)
	categoryGroupRecord.Set("name", name)
	categoryGroupRecord.Set("hidden", false)
	return categoryGroupRecord, nil
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
