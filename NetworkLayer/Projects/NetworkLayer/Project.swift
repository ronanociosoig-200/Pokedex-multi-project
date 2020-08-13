import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "NetworkLayer",
                                platform: .iOS,
                                dependencies: [
                                    .project(target: "NetworkLayerKit", path: .relativeToManifest("../NetworkLayerKit")),
                                    .project(target: "NetworkLayerSupport", path: .relativeToManifest("../NetworkLayerSupport"))

])
