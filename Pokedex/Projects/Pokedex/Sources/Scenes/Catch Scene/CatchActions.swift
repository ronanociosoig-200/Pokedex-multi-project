//
//  CatchActions.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import PokedexCore

protocol CatchActions {
    func catchPokemon()
}

extension Actions: CatchActions {
    func catchPokemon() {
        dataProvider?.catchPokemon()
    }
}
