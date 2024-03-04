# `fundwise_server`

## TODO

### Routes

- [ ] [`/`](./routes/index.dart)

  - [ ] OpenAPI spec?

- [ ] User

  - [ ] [`/user`](./routes/user.dart)
    - [ ] `GET` Single User Info

- [ ] Budgets

  - [ ] [`/budgets`](./routes/budgets/index.dart)
    - [ ] `GET` List Budgets
    - [ ] `POST` Create Budget
  - [ ] [`/budgets/[budgetId]`](./routes/budgets/[budgetId]/index.dart)
    - [ ] `GET` Single Budget
    - [ ] `PATCH` Update Budget
    - [ ] `DELETE` Delete Budget
  - [ ] [`/budgets/[budgetId]/settings`](./routes/budgets/[budgetId]/settings.dart)
    - [ ] `GET` Budget Settings
    - [ ] `PATCH` Budget Settings

- [ ] Accounts

  - [ ] [`/budgets/[budgetId]/accounts`](./routes/budgets/[budgetId]/accounts/index.dart)
    - [ ] `GET` Accounts List
    - [ ] `POST` Create New Account
  - [ ] [`/budgets/[budgetId]/accounts/[accountId]`](./routes/budgets/[budgetId]/accounts/[accountId]/index.dart)
    - [ ] `GET` Single Account
    - [ ] `PATCH` Update Account
    - [ ] `DELETE` Delete Account
  - [ ] [`/budgets/[budgetId]/accounts/[accountId]/transactions`](./routes/budgets/[budgetId]/accounts/[accountId]/transactions.dart)
    - [ ] `GET` List Transactions
    - [ ] `POST` Create Transaction

- [ ] Categories

  - [ ] [`/budgets/[budgetId]/categories`](./routes/budgets/[budgetId]/categories/index.dart)
    - [ ] `GET` List Categories
    - [ ] `POST` Create Category
  - [ ] [`/budgets/[budgetId]/categories/[categoryId]`](./routes/budgets/[budgetId]/categories/[categoryId]/index.dart)
    - [ ] `GET` Single Category
    - [ ] `PATCH` Update Category
    - [ ] `DELETE` Delete Category
  - [ ] [`/budgets/[budgetId]/categories/[categoryId]/transactions`](./routes/budgets/[budgetId]/categories/[categoryId]/transactions.dart)
    - [ ] `GET` List Transactions
    - [ ] `POST` Create Transaction

- [ ] Payees

  - [ ] [`/budgets/[budgetId]/payees`](./routes/budgets/[budgetId]/payees/index.dart)
    - [ ] `GET` List Payees
    - [ ] `POST` Create Payee
  - [ ] [`/budgets/[budgetId]/payees/[payeeId]`](./routes/budgets/[budgetId]/payees/[payeeId]/index.dart)
    - [ ] `GET` Sigle Payee
    - [ ] `PATCH` Update Payee
    - [ ] `DELETE` Delete Payee
  - [ ] [`/budgets/[budgetId]/payees/[payeeId]/transactions`](./routes/budgets/[budgetId]/payees/[payeeId]/transactions.dart)
    - [ ] `GET` List Transactions
    - [ ] `POST` Create Transaction

- [ ] Transactions

  - [ ] [`/budgets/[budgetId]/transactions`](./routes/budgets/[budgetId]/transactions/index.dart)
    - [ ] `GET` List Transactions
    - [ ] `POST` Create Transaction
  - [ ] [`/budgets/[budgetId]/transactions/[transactionId]`](./routes/budgets/[budgetId]/transactions/[transactionId].dart)
    - [ ] `GET` Single Transaction
    - [ ] `PATCH` Update Transaction
    - [ ] `DELETE` Delete Transaction
