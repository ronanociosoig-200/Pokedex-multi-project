//
//  Pokemon.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation

public struct Pokemon: Codable, Equatable {
    public static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let baseExperience: Int
    public let height: Int
    // swiftlint:disable identifier_name
    public let id: Int
    // swiftlint:enable identifier_name
    public let name: String
    public let order: Int
    public let species: Species
    public let sprites: Sprites
    public let types: [TypeElement]
    public let weight: Int
}

public struct Species: Codable {
    public let name: String
    public let url: String
}

public struct Sprites: Codable {
    public let backDefault: String?
    public let backFemale: String?
    public let backShiny: String?
    public let backShinyFemale: String?
    public let frontDefault: String?
    public let frontFemale: String?
    public let frontShiny: String?
    public let frontShinyFemale: String?
}

public struct TypeElement: Codable {
    public let slot: Int
    public let type: Species
}
