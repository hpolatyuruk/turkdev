package templates

import (
	"html/template"
	"net/http"
	"path/filepath"
)

var templatesPath = "./app/templates/"
var categories = []string{"comments", "stories", "user"}
var pseudoTmpl string = `{{define "main"}}{{template "base" .}}{{end}}`
var templates map[string]*template.Template

func Initialize() {
	if templates == nil {
		templates = make(map[string]*template.Template)
	}

	baseTemplates, err := filepath.Glob(templatesPath + "base/*.html")
	if err != nil {
		panic(err)
	}

	base := template.New("main")
	base, err = base.Parse(pseudoTmpl)
	if err != nil {
		panic(err)
	}

	for _, category := range categories {
		pages, err := filepath.Glob(templatesPath + category + "/*.html")
		if err != nil {
			panic(err)
		}
		for _, page := range pages {
			f := category + "/" + filepath.Base(page)
			files := append(baseTemplates, page)
			templates[f], err = base.Clone()
			if err != nil {
				panic(err)
			}
			templates[f] = template.Must(templates[f].ParseFiles(files...))
		}
	}
}

func Render(w http.ResponseWriter, tmpl string, data interface{}) {
	t, found := templates[tmpl]

	if !found {
		http.Error(w, "Cannot find template", http.StatusInternalServerError)
		return
	}

	err := t.Execute(w, data)
	if err != nil {
		http.Error(w, "Cannot parse template", http.StatusInternalServerError)
	}
}