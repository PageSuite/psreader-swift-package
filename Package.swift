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
            exact: "11.6.85755"
        )
    ],
    targets: [
        .binaryTarget(
            name: "PSReaderBinary",
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader/5.4.0/PSReader.xcframework.zip",
            checksum: "307d81ee461f0eb22907bca0a6fb7710eead43477a1c24dc161d2a1332e34dca"
        ),
        .binaryTarget(
            name: "PSReaderUIBinary",
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader-ui/5.4.0/PSReaderUI.xcframework.zip",
            checksum: "97f3f2b17ffe00f389811e7896fe61f5d2501485aa83bce46d33a0f73b5a279c"
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
