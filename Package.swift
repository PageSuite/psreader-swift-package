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
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader/26.1.0/PSReader.xcframework.zip",
            checksum: "43361e079f94c69a1612767edbd72ca4ba87fb15cc12097cabd74979029750dc"
        ),
        .binaryTarget(
            name: "PSReaderUIBinary",
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader-ui/26.1.0/PSReaderUI.xcframework.zip",
            checksum: "d57c5049af8fc9e8387b1af8bf1338010ebd62c30621e8162ed237ae54840ee2"
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
