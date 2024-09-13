package main

import (
	"log"
	"os"

	"github.com/pocketbase/pocketbase"
	"github.com/pocketbase/pocketbase/apis"
	"github.com/pocketbase/pocketbase/core"
)

func main() {
    app := pocketbase.New()

    // serves static files from the provided public dir (if exists)
    app.OnBeforeServe().Add(func(e *core.ServeEvent) error {
        e.Router.GET("/*", apis.StaticDirectoryHandler(os.DirFS("./pb_public"), false))
        return nil
    })

		app.OnModelAfterCreate("users").Add(func(e *core.ModelEvent) error {
			log.Print(e.Model.GetId())
			log.Print(e.Tags())
			e.BaseModelEvent.Tags()
			// prints name of user
			e.Model.TableName()
			return nil;
		})

    if err := app.Start(); err != nil {
        log.Fatal(err)
    }
}