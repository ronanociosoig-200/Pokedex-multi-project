import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "Profile", platform: .iOS, dependencies: [
    .project(target: "ProfileKit", path: .relativeToManifest("../ProfileKit"))
])
