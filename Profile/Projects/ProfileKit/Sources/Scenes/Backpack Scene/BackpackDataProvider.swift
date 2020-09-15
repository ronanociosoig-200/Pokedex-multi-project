//
//  BackpackDataProvider.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import PokedexCore
import PokedexCommon

public protocol BackpackDataProvider {
    func pokemons() -> [LocalPokemon]
}

extension DataProvider: BackpackDataProvider {
    
}
