// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LinkKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "LinkKit",
            targets: ["LinkKit"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "LinkKit",
            path: "LinkKit.xcframework"
        )
    ]
)
