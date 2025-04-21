// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Foras",
    products: [
        .executable(name: "Foras", targets: ["Foras"]),
    ],
    targets: [
        .executableTarget(
        name: "Foras",
        dependencies: [],
        path: "Sources/Foras"
        ),
        .testTarget(
            name: "ForasTests",
            dependencies: ["Foras"],
            path: "Tests/ForasTests"
        ),
    ]
)
