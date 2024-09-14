package main

import (
	"log"

	"github.com/pocketbase/pocketbase/daos"
	"github.com/pocketbase/pocketbase/models"
)

func CreateBudgetAccount(
	dao *daos.Dao,
	budgetId string,
	name string,
	accountType string,
	onBudget bool,
	closed bool,
	startingBalance int,
) (*models.Record, error) {
	budgetAccountCollection, err := dao.FindCollectionByNameOrId("budget_accounts")
	if err != nil {
		log.Printf("Failed to find budget_accounts collection: %v", err)
		return nil, err
	}

	budgetAccountRecord := models.NewRecord(budgetAccountCollection)
	budgetAccountRecord.Set("name", name)
	budgetAccountRecord.Set("account_type", accountType)
	budgetAccountRecord.Set("on_budget", onBudget)
	budgetAccountRecord.Set("closed", closed)
	budgetAccountRecord.Set("cleared_balance", startingBalance)
	budgetAccountRecord.Set("uncleared_balance", startingBalance)
	budgetAccountRecord.Set("budget", budgetId)

	err = dao.SaveRecord(budgetAccountRecord)
	if err != nil {
		log.Printf("Failed to save budget account record: %v", err)
		return nil, err
	}

	return budgetAccountRecord, nil
}
