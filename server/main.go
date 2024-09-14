package main

import (
	"log"

	"github.com/pocketbase/pocketbase"
	"github.com/pocketbase/pocketbase/core"
)

func main() {
	app := pocketbase.New()

	app.OnRecordAfterCreateRequest("users").Add(func(e *core.RecordCreateEvent) error {
		return OnUserCreated(e, app)
	})

	if err := app.Start(); err != nil {
		log.Fatal(err)
	}
}
