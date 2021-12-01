// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlideStyler",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "SlideStyler",
            targets: ["SlideStyler"]),
    ],
    dependencies: [
//      .package(name: "CodeStyler",
//               url: "https://github.com/dimsumthinking/CodeStyler.git",
//               branch: "main")
    ],
    targets: [
        .target(
            name: "SlideStyler",
            dependencies: [/*"CodeStyler"*/]),
        .testTarget(
            name: "SlideStylerTests",
            dependencies: ["SlideStyler"]),
    ]
)
