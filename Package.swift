// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOS-SSP-NAM-SPM",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AdMixerMediationNAM",
            targets: ["iOS_SSP_NAM_SPM"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/naver/nam-sdk-ios.git",
            from: "8.20.0"
        ),
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.3.6"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationNAMBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-NAM-SPM/releases/download/1.0.0/AdMixerMediationNAM1.0.0.xcframework.zip",
            checksum: "39e2f8bb733a3371738d65e956a07ee1dc9d164c4627b93681d3144dda7948e3"
        ),
        .target(
            name: "iOS_SSP_NAM_SPM",
            dependencies: [
                "AdMixerMediationNAMBinary",
                .product(name: "GFPSDK", package: "nam-sdk-ios"),
                .product(name: "AdMixerMediation", package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-NAM-SPM"
        ),

    ]
)
