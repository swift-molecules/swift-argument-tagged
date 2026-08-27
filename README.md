# swift-argument-tagged

`swift-argument-tagged` owns the narrow integration between
[`swift-argument`](https://github.com/swift-atoms/swift-argument) and
[`swift-tagged`](https://github.com/swift-atoms/swift-tagged):
`Argument.Environment.Variable.Name` as a tagged `String`.

```swift
import Argument_Tagged

let name = Argument.Environment.Variable.Name(_unchecked: "MYAPP_VERBOSITY")
```

Add the package and its `Argument Tagged` product to your Swift package:

```swift
.package(
    url: "https://github.com/swift-molecules/swift-argument-tagged.git",
    branch: "main"
)
```

String-literal construction is available to clients that also depend on and
import the `Tagged Standard Library Integration` product from `swift-tagged`.
