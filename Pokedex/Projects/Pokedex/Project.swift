import ProjectDescription

let project = Project(name: "Pokedex",
                      packages: [
                        .package(url: "https://github.com/JonasGessner/JGProgressHUD", .upToNextMajor(from: "2.0.0")) //,
                        // .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "14.0.0")),
                        // .package(url: "https://github.com/antitypical/Result.git", from: "5.0.0")
    ],
                      targets: [
                        Target(name: "Pokedex",
                               platform: .iOS,
                               product: .app,
                               bundleId: "com.wefox.Pokedex",
                               infoPlist: "Info.plist",
                               sources: ["Sources/**"],
                               resources: ["Resources/**","Sources/Scenes/**/*.storyboard",
                                           "Sources/Scenes/**/*.xib",
                                           "Sources/Views/**/*.xib"],
                               dependencies: [
                                .package(product: "JGProgressHUD"),
                                .project(target: "Haneke", path: .relativeToManifest("../../../Haneke/Projects/Haneke")),
                                .project(target: "ProfileKit", path: .relativeToManifest("../../../Profile/Projects/ProfileKit")),
                                .project(target: "PokedexCore", path: .relativeToManifest("../../../Pokedex/Projects/PokedexCore")),
                                .project(target: "PokedexCommon", path: .relativeToManifest("../../../Pokedex/Projects/PokedexCommon")),
                                .project(target: "AuthorizeKit", path: .relativeToManifest("../../../Authorize/Projects/AuthorizeKit"))
                        ]),
                        Target(name: "PokedexTests",
                               platform: .iOS,
                               product: .unitTests,
                               bundleId: "com.wefox.PokedexTests",
                               infoPlist: "Tests.plist",
                               sources: "Tests/**",
                               dependencies: [
                                .target(name: "Pokedex")
                        ])
])
