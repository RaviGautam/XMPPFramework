// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "XMPPFramework",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v8),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "XMPPFramework",
            targets: ["XMPPFramework"]
        ),
        .library(
            name: "XMPPFrameworkSwift",
            targets: ["XMPPFrameworkSwift"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", .upToNextMajor(from: "3.6.1")),
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket.git", .upToNextMajor(from: "7.6.4")),
        .package(url: "https://github.com/karimhm/KissXML.git", .branch("swift-pm")),
        .package(url: "https://github.com/karimhm/libidn-framework.git", .branch("swift_pm"))
    ],
    targets: [
        .target(
            name: "XMPPFramework",
            dependencies: [
                "CocoaLumberjack",
                "CocoaAsyncSocket",
                "KissXML",
                "libidn"
            ],
            path: ".",
            exclude: [
                "Swift",
                "Xcode",
            ],
            cSettings: [
                .headerSearchPath("Authentication"),
                .headerSearchPath("Authentication/Anonymous"),
                .headerSearchPath("Authentication/Deprecated-Digest"),
                .headerSearchPath("Authentication/Deprecated-Plain"),
                .headerSearchPath("Authentication/Digest-MD5"),
                .headerSearchPath("Authentication/Plain"),
                .headerSearchPath("Authentication/SCRAM-SHA-1"),
                .headerSearchPath("Authentication/X-OAuth2-Google"),
                .headerSearchPath("Core"),
                .headerSearchPath("Categories"),
                .headerSearchPath("Extensions"),
                .headerSearchPath("Extensions/BandwidthMonitor"),
                .headerSearchPath("Extensions/CoreDataStorage"),
                .headerSearchPath("Extensions/FileTransfer"),
                .headerSearchPath("Extensions/GoogleSharedStatus"),
                .headerSearchPath("Extensions/OMEMO"),
                .headerSearchPath("Extensions/OneToOneChat"),
                .headerSearchPath("Extensions/ProcessOne"),
                .headerSearchPath("Extensions/Reconnect"),
                .headerSearchPath("Extensions/Roster"),
                .headerSearchPath("Extensions/Roster/CoreDataStorage"),
                .headerSearchPath("Extensions/Roster/MemoryStorage"),
                .headerSearchPath("Extensions/SystemInputActivityMonitor"),
                .headerSearchPath("Extensions/XEP-0009"),
                .headerSearchPath("Extensions/XEP-0012"),
                .headerSearchPath("Extensions/XEP-0016"),
                .headerSearchPath("Extensions/XEP-0045"),
                .headerSearchPath("Extensions/XEP-0045/CoreDataStorage"),
                .headerSearchPath("Extensions/XEP-0045/HybridStorage"),
                .headerSearchPath("Extensions/XEP-0045/MemoryStorage"),
                .headerSearchPath("Extensions/XEP-0048"),
                .headerSearchPath("Extensions/XEP-0054"),
                .headerSearchPath("Extensions/XEP-0054/CoreDataStorage"),
                .headerSearchPath("Extensions/XEP-0059"),
                .headerSearchPath("Extensions/XEP-0060"),
                .headerSearchPath("Extensions/XEP-0065"),
                .headerSearchPath("Extensions/XEP-0066"),
                .headerSearchPath("Extensions/XEP-0077"),
                .headerSearchPath("Extensions/XEP-0082"),
                .headerSearchPath("Extensions/XEP-0085"),
                .headerSearchPath("Extensions/XEP-0092"),
                .headerSearchPath("Extensions/XEP-0100"),
                .headerSearchPath("Extensions/XEP-0106"),
                .headerSearchPath("Extensions/XEP-0115"),
                .headerSearchPath("Extensions/XEP-0115/CoreDataStorage"),
                .headerSearchPath("Extensions/XEP-0136"),
                .headerSearchPath("Extensions/XEP-0136/CoreDataStorage"),
                .headerSearchPath("Extensions/XEP-0147"),
                .headerSearchPath("Extensions/XEP-0153"),
                .headerSearchPath("Extensions/XEP-0172"),
                .headerSearchPath("Extensions/XEP-0184"),
                .headerSearchPath("Extensions/XEP-0191"),
                .headerSearchPath("Extensions/XEP-0198"),
                .headerSearchPath("Extensions/XEP-0198/Managed Messaging"),
                .headerSearchPath("Extensions/XEP-0198/Memory Storage"),
                .headerSearchPath("Extensions/XEP-0198/Private"),
                .headerSearchPath("Extensions/XEP-0199"),
                .headerSearchPath("Extensions/XEP-0202"),
                .headerSearchPath("Extensions/XEP-0203"),
                .headerSearchPath("Extensions/XEP-0223"),
                .headerSearchPath("Extensions/XEP-0224"),
                .headerSearchPath("Extensions/XEP-0280"),
                .headerSearchPath("Extensions/XEP-0297"),
                .headerSearchPath("Extensions/XEP-0308"),
                .headerSearchPath("Extensions/XEP-0313"),
                .headerSearchPath("Extensions/XEP-0333"),
                .headerSearchPath("Extensions/XEP-0334"),
                .headerSearchPath("Extensions/XEP-0335"),
                .headerSearchPath("Extensions/XEP-0352"),
                .headerSearchPath("Extensions/XEP-0357"),
                .headerSearchPath("Extensions/XEP-0359"),
                .headerSearchPath("Extensions/XEP-0363"),
                .headerSearchPath("Extensions/XMPPMUCLight"),
                .headerSearchPath("Extensions/XMPPMUCLight/CoreDataStorage"),
                .headerSearchPath("Utilities")
            ],
            linkerSettings: [
                .linkedLibrary("xml2"),
                .linkedLibrary("resolv")
            ]
        ),
        .target(
            name: "XMPPFrameworkSwift",
            dependencies: [
                "XMPPFramework",
                "CocoaLumberjackSwift"
            ],
            path: "Swift"
        ),
        .target(
            name: "XMPPFrameworkTestsShared",
            dependencies: [
                "XMPPFramework"
            ],
            path: "Xcode/Testing-Shared",
            sources: [
                "XMPPMockStream.m"
            ],
            publicHeadersPath: "."
        ),
        .testTarget(
            name: "XMPPFrameworkTests",
            dependencies: [
                "XMPPFramework",
                "XMPPFrameworkTestsShared"
            ],
            path: "Xcode/Testing-Shared",
            exclude: [
                "XMPPMockStream.m",
                "XMPPvCardTests.m",
                "XMPPRoomLightCoreDataStorageTests.m",
                "XMPPBookmarksTests.swift",
                "XMPPPushTests.swift",
                "XMPPStanzaIdTests.swift",
                "XMPPSwift.swift"
            ]
        ),
        .testTarget(
            name: "XMPPFrameworkSwiftTests",
            dependencies: [
                "XMPPFramework",
                "XMPPFrameworkSwift",
                "XMPPFrameworkTestsShared"
            ],
            path: "Xcode",
            exclude: [
                "XMPPFrameworkTests-Bridging-Header.h"
            ],
            sources: [
                "Testing-Shared/XMPPBookmarksTests.swift",
                "Testing-Shared/XMPPPushTests.swift",
                "Testing-Shared/XMPPStanzaIdTests.swift",
                "Testing-Shared/XMPPSwift.swift",
                "Testing-Swift/XMPPBookmarksModuleTests.swift",
                "Testing-Swift/XMPPPresenceTests.swift",
                "Testing-Swift/XMPPvCardTempTests.swift"
            ]
        )
    ]
)
