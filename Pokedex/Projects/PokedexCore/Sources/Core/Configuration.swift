//
//  Configuration.swift
//  ThoughtList
//
//  Created by Ronan on 09/02/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

public struct Configuration {
    public enum CommandLineOption: String {
        case UITesting = "UITesting"
        case networkTesting = "NetworkTesting"
        case networkError = "Error_401"
    }
    
    public static var uiTesting: Bool {
        
        // We can use CommandLine.arguments for this as well.
        let arguments = ProcessInfo.processInfo.arguments
        let result = arguments.contains(CommandLineOption.UITesting.rawValue)
        
        if result == true {
            // Speed up the animations in the app when running UI testing.
            UIApplication.shared.keyWindow?.layer.speed = 100
        }
        
        return result
    }
    
    public static var networkTesting: Bool {
        let arguments = CommandLine.arguments
        return arguments.contains(CommandLineOption.networkTesting.rawValue)
    }
    
    public static var authenticationErrorTesting: Bool {
        return CommandLine.arguments.contains(CommandLineOption.networkError.rawValue)
    }
}
