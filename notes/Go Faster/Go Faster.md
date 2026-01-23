## Basics Misc

Go is compiled to OS-specific executables and runs directly against physical machine resources and not on a virtual machine. Also asynchronous programming via concurrency and goroutines can fully utilize the multiple cores of modern CPU's better.

Instead of `inheritance` like traditional OOP languages Go has `composition` and `embedding`

Go is an opinionated language along with its formatting. This together with its simple syntax results in very readable and clear code.

Go comes with complete suite of built-in tooling which includes utilities for testing, building, profiling and more.

Unlike OOP languages which comes with inheritance Go has `composition` and `embedding`.

Go doesn't have `objects/instances` or `methods` in the OOP sense. Instead go has `receivers` (or receiver functions), named so because they receive the value (or the address of the value) of the type on which they are bound.

Go has interfaces.

Everything in Go is a value, Even pointers are just a value being the address of another value in memory. 

Errors are values too as Go doesn't have exceptions. Errors must be checked and handled explicitly, While being verbose and repetitive, contributes greatly to readability and comprehension.

Go doesn't have the concept of public and private like OOP. Instead go uses the notion of exported and unexported visibility modifiers.

Any variable, constant, function, receiver, type, structs declared with a lowercase first letter in its name is considered unexported and cannot be accessed outside its package namespace.

When capitalized is considered exported and fully visible to the package that imports it.

Comments in Go are especially useful since they are used to generate documentation. Developers write comments inline which then automatically form the basis of their software's documentation. The documentation itself is built from the code comments using a command line tool called Godoc. 

Comment standards
1. All exported functionality of a package is expected to have a comment. The comment should start with the function, variable or type name for which it is written, and should succinctly explain its purpose. Only comments in this format on exported functionality will be used to build documentation
2. The package itself should include a comment above the package name, which provides an overview of what the package does. This is used in the Overview section of the built documentation.
3. Links can be included in comments via an absolute URL which includes the schema e.g. HTTPS. Relative URLs are ignored. The Godoc tool will parse and include links which meet the requirements in the documentation.
4. Comments separated by a commented blank line will be interpreted as paragraphs and output as such in the package documentation.

## Go Lang Program Structure

```go
package main

import (
	"fmt"
	_ "github.com/golangatspeed/pkg/sideeffect"
)

func init() {
	fmt.Println("Hello, World!")
}

func main() {
	fmt.Println("Hello Once More, World!")
}
```

All Go code resides in a package. An application's package is always main.

The `import` keyword is used to include other packages, from either the go `std` lib or from external packages.

It's common to see external packages follow a semantic naming convention which represents their location on the web e.g. GitHub repo URL.

Rather than using the import keyword for each package we use brackets around all packages for conciseness.

The underscore prefix is called a `blank identifier`. This is how we tell the compiler that we don't need to refer to the package contents in our code but we do need to run the `init()` function.

We call this importing a package for its `side-effects`. Without the blank identifier, the compiler would complain about the unused import.

Packages can be prefixed with an alias which is useful when we experience naming collisions between similarly named packages, or wish to work with the package contents using a more semantic name than the package itself would.

Aliasing should be used judiciously to add clarity and not as a joke.

```go
// How not to use aliasing
package main

import (
	log "fmt"
	fmt "log"
)
func main() {
	fmt.Println("This looks like log.Println output")
	log.Println("This looks like log.Println output")
}
```

There is also a `dot` prefix which can be used to promote the functionality of an imported package to the current package namespace, allowing the package prefix to be omitted when making calls to its contents.

This rarely seen in practice as it mainly detracts from clarity. Only by inspecting the imported packages are we able to determine which it is.

```go
package main

import (
	. "log"
)

func main() {
	Println("Sample Text")
}
```

The `main()` function is considered to be the entry point of the application - the top of the call stack. There is only one per executable. It takes no arguments and expects no return values.

Every package including main can have an `init()` function. Every included package with an `init()` function will have that function executed once at the application start up. `init()` functions are executed before `main()` but after package level variables are evaluated. Their use be constrained to the initial setup, for example reading env variables or a config file.

When developing packages for a distributed library and not an executable there will be no `main()` function and the package name should be something other than main.

When it comes to structuring our source code withing the project folder, Go is mostly un-opinionated. There is one special case the `internal` folder.

The `internal` folder gets special treatment from the Go tool which uses it to limit access to packages contained within it. It effectively makes code invisible to another package unless it shares a common ancestor.

Most often this is used to prevent external modules from accessing code which a developer does not want to share or maintain a public API for.

Similar to using the unexported visibility modifier in the code itself, we should incorporate `internal` into our project organisation to hide entire packages which are for internal use only.