//
//  AppController.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation
import NetworkLayerKit
import PokedexCore

protocol AppControlling {
    func start()
}

class AppController: AppControlling {
    var coordinator: Coordinating?
    
    func start() {
        let dataProvider = DataProvider(service: NetworkLayerKit())
        
        if Configuration.uiTesting == true {
            let storage = FileStorage()
            storage.remove(Constants.pokemonFile, from: dataProvider.directory())
        }
        
        dataProvider.start()
        
        coordinator = Coordinator()
        coordinator?.dataProvider = dataProvider
        coordinator?.start()
        
        dataProvider.notifier = coordinator as? Notifier
    }
}
