package main

import (
	"log"
	"net/http"
	"turkdev/app/controllers"
	"turkdev/app/templates"
	"turkdev/shared"
)

func main() {

	templates.Initialize()

	http.HandleFunc("/", errorHandler(controllers.StoriesHandler))
	http.HandleFunc("/recent", errorHandler(controllers.RecentStoriesHandler))
	http.HandleFunc("/comments", errorHandler(controllers.CommentsHandler))
	http.HandleFunc("/stories/new", errorHandler(controllers.SubmitStoryHandler))
	http.HandleFunc("/saved", errorHandler(controllers.SavedStoriesHandler))
	http.HandleFunc("/invite", errorHandler(controllers.InviteUserHandler))
	http.HandleFunc("/replies", errorHandler(controllers.RepliesHandler))
	http.HandleFunc("/settings", errorHandler(controllers.UserSettingsHandler))
	http.HandleFunc("/login", errorHandler(controllers.SignInHandler))

	staticFileServer := http.FileServer(http.Dir("app/static/"))

	http.Handle("/static/", http.StripPrefix("/static/", staticFileServer))

	http.ListenAndServe(":80", nil)
}

func errorHandler(f func(http.ResponseWriter, *http.Request) error) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		err := f(w, r)
		if err != nil {
			//logger.Error("Returned 500 internal server error! - " + r.Host + r.RequestURI + " - " + err.Error())
			byteValue, err := shared.ReadFile("app/static/html/500.html")
			if err != nil {
				log.Printf("Error occured in readFile func. Original err : %v", err)
			}
			w.WriteHeader(500)
			w.Write(byteValue)
		}
	}
}
