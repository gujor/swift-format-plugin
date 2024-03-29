# Swift Format Plugin

A Swift Package Manager command plugin for [Swift-Format](https://github.com/apple/swift-format). 

No more subjective code formatting discussions. Just use the default configuration. And you get two space indentation. Which is the best. In my opinion. :)

To use this plugin from another package, add a dependency to it:
```swift
// swift-tools-version: 5.7
import PackageDescription

let package = Package(
  name: "MyLibrary",
  dependencies: [
    .package(
      url: "https://github.com/gujor/swift-format-plugin",
      branch: "main"
    )
  ],
  targets: [
    .target(name: "MyLibrary")
  ]
)
```

Invoke this command plugin using the `swift` `package` invocation:
```
> swift package --allow-writing-to-package-directory format-source-code
```

About [Package Manager Command Plugins](https://github.com/apple/swift-evolution/blob/main/proposals/0332-swiftpm-command-plugins.md#example-2-formatting-source-code).
