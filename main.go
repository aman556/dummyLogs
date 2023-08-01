package main

import (
	"log"
	"os"
)

func main() {
	f, err := os.OpenFile("logs.txt", os.O_RDWR|os.O_APPEND, 0666)

	if err != nil {
		log.Println("error in opening the file")
		log.Fatalln(err)
	}

	defer f.Close()
}
