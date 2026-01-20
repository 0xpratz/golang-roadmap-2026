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

