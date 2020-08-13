import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "Authorize", platform: .iOS, dependencies: [
    .project(target: "AuthorizeKit", path: .relativeToManifest("../AuthorizeKit"))
])
