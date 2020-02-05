package controllers

import (
	"fmt"
	"net/http"
	"time"
	"turkdev/app/models"
	"turkdev/app/src/templates"
	"turkdev/data"

	"github.com/gorilla/sessions"
)

var (
	// key must be 16, 24 or 32 bytes long (AES-128, AES-192 or AES-256)
	key   = []byte("super-secret-key")
	store = sessions.NewCookieStore(key)
)

/*UserSettingsHandler handles showing user profile detail*/
func UserSettingsHandler(w http.ResponseWriter, r *http.Request) error {
	title := "User Settings | Turk Dev"
	userViewModel := models.User{"Anil Yuzener"}

	userName := r.URL.Query().Get("username")
	if len(userName) == 0 {
		// TODO(Anil): There is no user. Show appropriate message here
		return nil
	}
	user, err := data.GetUserByUserName(userName)
	if err != nil {
		// TODO(Anil): Show error page here
	}
	if user != nil {
		// TODO(Anil): User does not exist. Show appropriate message here
	}

	// TODO(Anil): Maybe map user struct to viewmodel here? up to you.

	data := map[string]interface{}{
		"Content": "Settings",
		"User":    user,
	}

	templates.Render(
		w,
		"user/settings.html",
		models.ViewModel{
			title,
			userViewModel,
			data,
		},
	)
	return nil
}

func SignUpHandler(w http.ResponseWriter, r *http.Request) {
	switch r.Method {
	case "GET":
		handleSignUpGET(w, r)
	case "POST":
		handleSignUpPOST(w, r)
	default:
		handleSignUpGET(w, r)
	}
}

/*SignInHandler handles users' signin operations*/
func SignInHandler(w http.ResponseWriter, r *http.Request) error {
	title := "Sign-In | Turk Dev"
	user := models.User{"Anil Yuzener"}
	data := map[string]interface{}{
		"Content": "User sign-in",
	}

	templates.Render(
		w,
		"user/sign-in.html",
		models.ViewModel{
			title,
			user,
			data,
		},
	)

	/*session, _ := store.Get(r, "cookie-name")
	status, err := data.LoginUser(userName, password)
	if status == data.LoginSuccessful {
		session.Values["authenticated"] = true
		session.Save(r, w)
	}*/

	return nil
}

/*InviteUserHandler handles sending invitations to user*/
func InviteUserHandler(w http.ResponseWriter, r *http.Request) error {
	title := "Invite a new user | Turk Dev"
	user := models.User{"Anil Yuzener"}
	data := map[string]interface{}{
		"Content": "Invite a new user",
	}

	templates.Render(
		w,
		"user/sign-up.html",
		models.ViewModel{
			title,
			user,
			data,
		},
	)
	return nil
}

/*LogoutHandler set cookie authenticated is false.*/
func LogoutHandler(w http.ResponseWriter, r *http.Request) error {
	session, _ := store.Get(r, "cookie-name")
	session.Values["authenticated"] = false
	session.Save(r, w)

	// TODO : Redirect bla bla.
	return nil
}

/*CheckCookieSet check cookie is "authenticated" or not.*/
func CheckCookieSet(w http.ResponseWriter, r *http.Request) bool {
	session, _ := store.Get(r, "cookie-name")
	if auth, ok := session.Values["authenticated"].(bool); !ok || !auth {
		return false
	}
	return true
}

func handleSignUpGET(w http.ResponseWriter, r *http.Request) {
	title := "Sign Up | Turk Dev"
	user := models.User{"Anil Yuzener"}

	data := map[string]interface{}{
		"Content": "Sign Up",
	}

	templates.Render(
		w,
		"users/signup.html",
		models.ViewModel{
			title,
			user,
			data,
		},
	)
}

func handleSignUpPOST(w http.ResponseWriter, r *http.Request) {
	if err := r.ParseForm(); err != nil {
		fmt.Fprintf(w, "Handling sign up post error: %v", err)
	}

	userName := r.FormValue("userName")
	email := r.FormValue("email")
	password := r.FormValue("password")

	var user data.User
	user.UserName = userName
	user.Email = email
	user.Password = password
	user.Karma = 0
	user.RegisteredOn = time.Now()
	user.CustomerID = 1 // TODO: get it real customer id
	err := data.CreateUser(&user)

	if err != nil {
		// TODO: log it here
		fmt.Fprintf(w, "Error creating user: %v", err)
	}
	fmt.Fprintf(w, "Succeded!")
}
