//
//  CatchDataProvider.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation
import PokedexCore

protocol CatchDataProvider {
    func pokemon() -> ScreenPokemon?
    func newSpecies() -> Bool
}

extension DataProvider: CatchDataProvider {

}
