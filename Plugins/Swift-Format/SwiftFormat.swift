import Foundation
import PackagePlugin

// Inspiration: https://github.com/apple/swift-evolution/blob/main/proposals/0332-swiftpm-command-plugins.md#example-2-formatting-source-code
@main struct SwiftFormat: CommandPlugin {
  func performCommand(
    context: PackagePlugin.PluginContext,
    arguments: [String]
  ) async throws {
    let swiftFormatTool = try context.tool(named: "swift-format")

    let configFile = context.package.directory.appending(".swift-format.json")
    let configArgument = FileManager.default.fileExists(atPath: configFile.string)
      ? "--configuration \(configFile)"
      : nil

    let arguments = [
      configArgument,
      "--in-place",
      "--recursive",
    ] .compactMap { $0 }

    for target in context.package.targets {
      guard let target = target as? SourceModuleTarget else { continue }

      let swiftFormatExec = URL(fileURLWithPath: swiftFormatTool.path.string)
      let targetArguments = arguments + ["\(target.directory)"]

      let process = try Process.run(swiftFormatExec, arguments: targetArguments)
      process.waitUntilExit()

      if process.terminationReason == .exit && process.terminationStatus == 0 {
        print("Formatted the source code in \(target.directory).")
      } else {
        let problem = "\(process.terminationReason):\(process.terminationStatus)"
        Diagnostics.error("swift-format invocation failed: \(problem)")
      }
    }
  }
}
