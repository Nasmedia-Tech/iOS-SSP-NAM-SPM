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
            "8.20.0"..<"8.23.0"
        ),
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.4.2"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationNAMBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-NAM-SPM/releases/download/1.3.3/AdMixerMediationNAM1.3.3.xcframework.zip",
            checksum: "d55d8bfb5f81c3d29727f3e4ee40b941da374cab93631b93662a230a6ab1722b"
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
