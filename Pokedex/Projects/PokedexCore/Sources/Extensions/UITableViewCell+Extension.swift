//
//  UITableViewCell+Extension.swift
//  InTune
//
//  Created by Ronan on 26/11/2018.
//  Copyright © 2018 Sonomos. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    
    /// UITableViewCell identifier
    static var identifier: String {
        return String(describing: self)
    }
}

public extension UITableView {
    
    /// Register UITableViewCell type
    func register(cellType: UITableViewCell.Type) {
        self.register(UINib(nibName: cellType.identifier, bundle: nil), forCellReuseIdentifier: cellType.identifier)
    }
    
    /// Register UITableViewCell types
//    public func register(cellTypes: UITableViewCell.Type...) {
//        cellTypes.forEach(register)
//    }
    
    /**
     Dequeue generic type `element` of `UITableViewCell` for `indexPath`
     
     - Parameters:
     - cellType: Element.Type
     - indexPath: header for `IndexPath`
     */
    func dequeue<Element: UITableViewCell>(cellType: Element.Type, for indexPath: IndexPath) -> Element {
        let cell = dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath)
        
        guard let element = cell as? Element else {
            fatalError("Cell \(cell) cannot be casted as \(cellType.identifier)")
        }
        
        return element
    }
}

public extension UICollectionViewCell {
    
    /// UITableViewCell identifier
    static var identifier: String {
        return String(describing: self)
    }
}

public extension UICollectionView {
    
    /// Register UITableViewCell type
    func register(cellType: UICollectionViewCell.Type) {
        self.register(UINib(nibName: cellType.identifier, bundle: nil), forCellWithReuseIdentifier: cellType.identifier)
    }
    
    func register(cellType: UICollectionViewCell.Type, bundle: Bundle) {
        self.register(UINib(nibName: cellType.identifier, bundle: bundle), forCellWithReuseIdentifier: cellType.identifier)
    }
    
    /**
     Dequeue generic type `element` of `UICollectionViewCell` for `indexPath`
     
     - Parameters:
     - cellType: Element.Type
     - indexPath: header for `IndexPath`
     */
    func dequeue<Element: UICollectionViewCell>(cellType: Element.Type, for indexPath: IndexPath) -> Element {
        let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath)
        
        guard let element = cell as? Element else {
            fatalError("Cell \(cell) cannot be casted as \(cellType.identifier)")
        }
        
        return element
    }
}
