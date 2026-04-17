// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PSReaderSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "PSReaderSDK", targets: ["PSReaderSDK"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/pdftron/pdftron-swift-package.git",
            exact: "11.5.85515"
        )
    ],
    targets: [
        .binaryTarget(
            name: "PSReaderBinary",
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader/26.4.1/PSReader.xcframework.zip",
            checksum: "f94e9e682a3293ff88ab458a49f9e31b90c30c22929bfc19da714ec7911a8bad"
        ),
        .binaryTarget(
            name: "PSReaderUIBinary",
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader-ui/26.4.1/PSReaderUI.xcframework.zip",
            checksum: "c27768ebac94c05f102336e807b963637a606c52b95f9f868f3d444a8bed499b"
        ),
        .target(
            name: "PSReaderSDK",
            dependencies: [
                "PSReaderBinary",
                "PSReaderUIBinary",
                .product(name: "PDFTron", package: "pdftron-swift-package")
            ],
            path: "PSReaderSDKWrapper"
        )
    ]
)
