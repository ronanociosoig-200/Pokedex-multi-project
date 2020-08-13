//
//  DataProvider.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation
import os.log
import NetworkLayerKit

struct Log {
    static var general = OSLog(subsystem: "com.sonomos.InTune", category: "general")
    static var network = OSLog(subsystem: "com.sonomos.InTune", category: "network")
    static var data = OSLog(subsystem: "com.sonomos.InTune", category: "data")
}

public protocol DataProviding {
    init(service: SearchProviding)
    
    func search(identifier: Int)
    func catchPokemon()
    func newSpecies() -> Bool
    func pokemon(at index: Int) -> LocalPokemon
    func pokemons() -> [LocalPokemon]
    func pokemon() -> ScreenPokemon?
    func directory() -> Directory
}

public class DataProvider: DataProviding {
    let appData = AppData(storage: FileStorage())
    public var notifier: Notifier?
    private let networkService: SearchProviding
    
    public required init(service: SearchProviding) {
        self.networkService = service
    }
    
    public func start() {
        appData.load()
        appData.sortByOrder()
    }
    
    public func search(identifier: Int) {
        appData.pokemon = nil
        
        networkService.search(identifier: identifier) { (data, errorMessage) in
            let queue = DispatchQueue.main
            
            if let errorMessage = errorMessage {
                if errorMessage == Constants.Translations.Error.statusCode404 {
                    self.notifier?.dataReceived(errorMessage: errorMessage, on: queue)
                    return
                }
                
                os_log("Error message: %s", log: Log.network, type: .error, errorMessage)
                self.notifier?.dataReceived(errorMessage: errorMessage, on: queue)
                return
            }
            
            guard let data = data else {
                os_log("Error message: %s", log: Log.network, type: .error, Constants.Translations.Error.noDataError)
                self.notifier?.dataReceived(errorMessage: Constants.Translations.Error.noDataError, on: queue)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pokemon = try decoder.decode(Pokemon.self, from: data)
                self.appData.pokemon = pokemon
                self.notifier?.dataReceived(errorMessage: nil, on: queue)
                os_log("Success: %s", log: Log.network, type: .default, "Loaded")
            } catch {
                let errorMessage = "\(error)"
                os_log("Error: %s", log: Log.data, type: .error, errorMessage)
                self.notifier?.dataReceived(errorMessage: errorMessage, on: queue)
            }
        }
    }
    
    public func catchPokemon() {
        guard let pokemon = appData.pokemon else { return }
        let localPokemon = PokemonParser.parse(pokemon: pokemon)
        appData.pokemons.append(localPokemon)
        appData.sortByOrder()
        appData.save()
    }
    
    public func pokemon() -> ScreenPokemon? {
        guard let foundPokemon = appData.pokemon else { return nil }
        return ScreenPokemon(name: foundPokemon.name,
                             weight: foundPokemon.weight,
                             height: foundPokemon.height, iconPath: foundPokemon.sprites.frontDefault)
    }
    
    public func newSpecies() -> Bool {
        return appData.newSpecies()
    }
    
    public func pokemon(at index: Int) -> LocalPokemon {
        return appData.pokemons[index]
    }
    
    public func pokemons() -> [LocalPokemon] {
        return appData.pokemons
    }
    
    public func directory() -> Directory {
        return appData.directory()
    }
}
