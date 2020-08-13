import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "HanekeTestHarness", platform: .iOS, dependencies: [
    .project(target: "Haneke", path: .relativeToManifest("../Haneke"))
])
