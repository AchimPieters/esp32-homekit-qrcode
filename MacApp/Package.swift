// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "HomeKitQRCodeApp",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "HomeKitQRCodeApp", targets: ["HomeKitQRCodeApp"])
    ],
    targets: [
        .executableTarget(
            name: "HomeKitQRCodeApp",
            path: ".",
            resources: [
                .copy("gen_qrcode"),
                .copy("barcode39.ttf"),
                .copy("SF-Pro-Text-Regular.otf")
            ]
        )
    ]
)
