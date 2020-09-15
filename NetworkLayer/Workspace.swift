import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(name: "NetworkLayer", projects: [
    "Projects/NetworkLayer",
    "Projects/NetworkLayerKit",
    "Projects/NetworkLayerSupport",
    "../Pokedex/Projects/PokedexCommon"
])
