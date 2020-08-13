//
//  SimpleViewController.swift
//  HanekeTestHarness
//
//  Created by Ronan O'Ciosoig on 11/08/2020.
//

import UIKit
import Haneke

class SimpleViewController: UIViewController {
    let imagePath = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/196.png"
    
    override func viewDidLoad() {
        let imageView = UIImageView()
        view.addSubview(imageView)

        guard let imageURL = URL(string: imagePath) else {
            print("Error creating image URL")
            return
        }
        
        imageView.hnk_setImage(from: imageURL)
    }
}
