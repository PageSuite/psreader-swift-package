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
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader/5.2.0/PSReader.xcframework.zip",
            checksum: "62bc373c45cc2734b9464ddcbbdbd6b238e22f7072e71d2880d796d445105866"
        ),
        .binaryTarget(
            name: "PSReaderUIBinary",
            url: "https://pagesuite-builds.s3.eu-west-1.amazonaws.com/spm/psreader-ui/5.2.0/PSReaderUI.xcframework.zip",
            checksum: "945b86e63c2f76ab15f32e375f7531ff21f8f6ac696d13b704e2735790a48cc3"
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
