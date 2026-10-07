// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Fabre",
    platforms: [.iOS(.v14)],
    products: [.library(name: "Fabre", targets: ["ScreenReporter"])],
    targets: [.binaryTarget(
        name: "ScreenReporter",
        url: "https://sdk.affisto.com/fabre/ios/0.1.0-beta.1/Fabre-0.1.0-beta.1.xcframework.zip",
        checksum: "8dd03da51c79b19e4a337aa30f5fdb9690cb1026512626b26c197d3bd4940b4d"
    )]
)
