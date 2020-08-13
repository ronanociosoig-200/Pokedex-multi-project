import ProjectDescription
// import ProjectDescriptionHelpers

//let project = Project.framework(name: "ProfileKit", platform: .iOS, dependencies: [
//    .project(target: "Haneke", path: .relativeToManifest("../../../Haneke/Projects/Haneke")),
//    .project(target: "PokedexCore", path: .relativeToManifest("../../../Pokedex/Projects/PokedexCore")),
//])

let project = Project(name: "ProfileKit",
                      packages: [],
                      targets: [
                        Target(name: "ProfileKit",
                               platform: .iOS,
                               product: .framework,
                               bundleId: "com.wefox.ProfileKit",
                               infoPlist: .default,
                               sources: ["Sources/**"],
                               resources: ["Sources/Scenes/**/*.storyboard", "Sources/Scenes/**/*.xib"],
                               dependencies: [
                                .project(target: "Haneke", path: .relativeToManifest("../../../Haneke/Projects/Haneke")),
                                .project(target: "PokedexCore", path: .relativeToManifest("../../../Pokedex/Projects/PokedexCore")),
                        ])
])
