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
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader/5.5.0/PSReader.xcframework.zip",
            checksum: "1a8f98fb23600ffb7f81bdbb6d1953cf3094d0ca6045983ef940dc6d796166ff"
        ),
        .binaryTarget(
            name: "PSReaderUIBinary",
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader-ui/5.5.0/PSReaderUI.xcframework.zip",
            checksum: "d97f7b2fe92cd534a80e5128cd4913119de5e20929e2de0a668712f276565a1d"
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
