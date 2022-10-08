# Swift Format Plugin

A Swift Package Manager command plugin for Swift-Format.

To use this plugin from another packagage, add a dependency to it:
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
