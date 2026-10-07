# Fabre for iOS

Fabre's native iOS SDK for screenshot-based bug reports, annotations and selected
diagnostics. The implementation is distributed as an XCFramework under the
[Fabre SDK License](LICENSE).

## Install with Xcode

1. Choose **File → Add Package Dependencies**.
2. Enter `https://github.com/affisto/fabre-ios.git`.
3. Select **Exact Version: 0.1.0-beta.1**.
4. Add the **Fabre** product to your app target.

No GitHub account or download token is required. This package contains only the
binary reference and documentation; Xcode downloads and checks the framework's
SHA-256 automatically.

Requirements: iOS 14 or later. The binary contains device arm64 and simulator
arm64/x86_64 slices. Built and validated with Xcode 26.1.1. This is a beta SDK;
other Xcode/toolchain combinations are not yet covered by a compatibility matrix.

## Import and initialize

The installed product is named **Fabre**. Its Swift module and API names remain
`ScreenReporter` for compatibility with existing integrations.

```swift
import UIKit
import ScreenReporter
```

Retain one reporter for the owning window and call UI APIs on the main thread:

```swift
let reporter = ScreenReporter(
    configuration: ReporterConfiguration(
        apiKey: "PROJECT_INGEST_KEY",
        endpoint: URL(string: "https://YOUR_FABRE_SERVER")!,
        recipient: "YOUR_PROJECT_NAME"
    ),
    window: window
)

// Invoke from a user-facing action, then approve the device in the console.
reporter.requestDeviceRegistration()

// After approval, provide a manual report entry point.
reporter.showReport()

// When the owning integration is disposed:
// reporter.close()
```

Use a project ingest key, never an account/admin/MCP token. Service access and
billing are separate from SDK download permissions. This binary includes its
privacy manifest, offline editor resources and SDK license.

## Direct download

- [XCFramework ZIP](https://sdk.affisto.com/fabre/ios/0.1.0-beta.1/Fabre-0.1.0-beta.1.xcframework.zip)
- [SHA-256](https://sdk.affisto.com/fabre/ios/0.1.0-beta.1/Fabre-0.1.0-beta.1.xcframework.zip.sha256)
- [Completed release manifest](https://sdk.affisto.com/fabre/releases/ios/0.1.0-beta.1.json)

For manual integration, extract the ZIP, add `ScreenReporter.xcframework` to your
app, and configure **Embed & Sign**. Do not install both the manual framework and
the Swift package in the same app target.

Release files are immutable. An update uses a new version and checksum.
Copyright © 2026 Affisto Corp.
