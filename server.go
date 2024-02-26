package main

import (
	"embed"
	"io/fs"
	"log"
	"net/http"
)

//go:embed public/*
var public embed.FS

func main() {
	publicDir, err := fs.Sub(public, "public")
	if err != nil {
		log.Fatalln("Error accessing embedded directory:", err)
		return
	}
	http.Handle("/", http.FileServer(http.FS(publicDir)))
	log.Println("starting server at http://localhost")
	log.Fatalln(http.ListenAndServe(":80", nil))
}
