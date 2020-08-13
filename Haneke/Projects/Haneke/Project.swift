import ProjectDescription
import ProjectDescriptionHelpers

// let project = Project.framework(name: "Haneke", platform: .iOS, dependencies: [])

let project = Project(name: "Haneke",
                      targets: [
                        Target(name: "Haneke",
                               platform: .iOS,
                               product: .framework,
                               productName: "Haneke",
                               bundleId: "io.tuist.Framework1",
                               infoPlist: "Info.plist",
                               sources: "Sources/**",
                               headers: Headers(public: ["Sources/**/*.h"]),
                               dependencies: [])
                        ])
