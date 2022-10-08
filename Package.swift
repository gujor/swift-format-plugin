// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "SwiftFormatPlugin",
  platforms: [.macOS(.v11)],
  products: [
    .plugin(name: "Swift-Format", targets: ["Swift-Format"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-format.git", from: "0.50700.0"),
    //.package(url: "https://github.com/apple/swift-format.git", branch: "release/5.7")
  ],
  targets: [
    .plugin(
      name: "Swift-Format",
      capability: .command(
        intent: .sourceCodeFormatting(),
        permissions: [
          .writeToPackageDirectory(reason: "This command reformats source files")
        ]
      ),
      dependencies: [
        .product(name: "swift-format", package: "swift-format")
      ]
    ),
  ]
)
