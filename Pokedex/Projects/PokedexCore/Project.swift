import ProjectDescription

let project = Project(name: "PokedexCore",
                      packages: [
                        //.package(url: "https://github.com/JonasGessner/JGProgressHUD", .upToNextMajor(from: "2.0.0"))
    ],
                      targets: [
                        Target(name: "PokedexCore",
                               platform: .iOS,
                               product: .framework,
                               bundleId: "com.wefox.PokedexCore",
                               infoPlist: "Info.plist",
                               sources: ["Sources/**"],
                               resources: ["Resources/**"],
                               dependencies: [
                                .project(target: "NetworkLayerKit", path: .relativeToManifest("../../../NetworkLayer/Projects/NetworkLayerKit"))
                        ])
])
