package example

import (
	"fmt"
	"inittest/example2"
)

func init() {
	fmt.Println("example")
}

func Example() {
	fmt.Println("Hello, From Example!")
	example2.Example2()
}
