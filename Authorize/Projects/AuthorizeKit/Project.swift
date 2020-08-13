import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: "AuthorizeKit", platform: .iOS, dependencies: [
    .project(target: "AuthorizeSupport", path: .relativeToManifest("../AuthorizeSupport"))
])
