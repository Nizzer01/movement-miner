package main

import (
	"fmt"
	"net/http"
)

func main() {
	mux := http.NewServeMux()

	// Health check endpoint
	mux.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("OK"))
	})

	fmt.Println("Gateway service running on :8080")

	// Blocking server loop
	if err := http.ListenAndServe(":8080", mux); err != nil {
		panic(err)
	}
}
