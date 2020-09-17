import ProjectDescription

let project = Project(name: "NetworkLayerKit",
                      packages: [
                        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "14.0.0")),
                        .package(url: "https://github.com/antitypical/Result.git", from: "5.0.0"),
                        .package(url: "https://github.com/AliSoftware/OHHTTPStubs", from: "9.0.0")
    ],
                      targets: [
                        Target(name: "NetworkLayerKit",
                               platform: .iOS,
                               product: .framework,
                               bundleId: "com.wefox.NetworkLayer",
                               infoPlist: "Info.plist",
                               sources: ["Sources/**"],
                               resources: [
                                /* Path to resouces can be defined here */
                                // "Resources/**"
                            ],
                               dependencies: [
                                .package(product: "Moya"),
                                .package(product: "Result"),
                                .project(target: "PokedexCommon", path: .relativeToManifest("../../../Pokedex/Projects/PokedexCommon"))
                        ]),
                        Target(name: "NetworkLayerKitTests",
                               platform: .iOS,
                               product: .unitTests,
                               bundleId: "com.wefox.NetworkLayerTests",
                               infoPlist: "Tests.plist",
                               sources: "Tests/**",
                               resources: "Tests/**",
                               dependencies: [
                                .target(name: "NetworkLayerKit"),
                                .package(product: "OHHTTPStubsSwift")
                        ])
])
