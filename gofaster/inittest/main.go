package main

import (
	"fmt"
	"inittest/example"
)

func init() {
	fmt.Println("main")
}

func main() {
	fmt.Println("Hello, From Main!")
	example.Example()
}
