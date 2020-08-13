//
//  BackpackWireframe.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit
import PokedexCore

public class BackpackWireframe {
    
    public static func makeViewController() -> BackpackViewController {
        let bundle = Bundle.init(for: BackpackViewController.self)
        let storyboard = UIStoryboard.init(name: "BackpackViewController", bundle: bundle)
        return BackpackViewController.instantiateFromStoryboard(storyboard: storyboard)
    }
    
    public static func makeNavigationController() -> UINavigationController {
        let viewController = makeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let navigationBarButton = UIBarButtonItem(title: Constants.Translations.BackpackScene.closeButton,
                                                  style: .plain) { _ in
                                                    viewController.dismiss(animated: true, completion: nil)
        }
        
        viewController.navigationItem.leftBarButtonItem = navigationBarButton
        
        return navigationController
    }
    
    public static func prepare(_ viewController: BackpackViewController, actions: BackpackActions, dataProvider: BackpackDataProvider) {
    	let presenter =  BackpackPresenter(actions: actions, dataProvider: dataProvider, view: viewController)
        viewController.presenter = presenter
    }
}
