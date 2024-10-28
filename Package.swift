// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "rest-codable",
	platforms: [
		.macOS(.v13),
		.iOS(.v16),
		.watchOS(.v9),
		.tvOS(.v16),
	],
    products: [
        .library(name: "RestCodable", targets: ["RestCodable"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "RestCodable", dependencies: []),
		.testTarget(name: "RestCodableTests", dependencies: ["RestCodable"]),
    ]
)
