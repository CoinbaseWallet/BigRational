// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BigRational",
    products: [
        .library(name: "BigRational", targets: ["BigRational"]),
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", from: "3.1.0")
    ],
    targets: [
        .target(name: "BigRational", dependencies: ["BigInt"], path: "./Sources"),
        .testTarget(name: "BigRationalTests", dependencies: ["BigRational"], path: "./Tests"),
    ]
)
