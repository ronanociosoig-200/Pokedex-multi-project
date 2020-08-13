//
//  Coordinating.swift
//  PokedexCore
//
//  Created by Ronan O'Ciosoig on 11/08/2020.
//

import Foundation

public protocol Updatable {
    func update()
    func showError(message: String)
}

public protocol Coordinating {
    var dataProvider: DataProvider? { get set }
    
    func start()
    func showLoading()
    func dismissLoading()
    func showHomeScene()
    func showCatchScene()
    func showBackpackScene()
    func showPokemonDetailScene(pokemon: LocalPokemon)
    func showAlert(with errorMessage: String)
}
