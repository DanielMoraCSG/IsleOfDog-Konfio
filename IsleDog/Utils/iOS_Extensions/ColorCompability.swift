//
//  ColorCompability.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/27/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import UIKit

/// Use this colors for compability iOS Black Mode in Future
enum ColorCompatibility {
    
    /// The Color name can change tomorrow, best set with another name of not a system color <- Comment exam 
    static var label: UIColor {
        // If want to available BlackMode change color below
        if #available(iOS 13, *) {
            return UIColor(hex: "#333333")
        }
        return UIColor(hex: "#333333")
    }
    
    static var secondaryLabel: UIColor {
        // If want to available BlackMode change color below
        if #available(iOS 13, *) {
            return .secondaryLabel
        }
        return UIColor(hex: "#333333")
    }
    
    static var systemBackground: UIColor {
        // If want to available BlackMode change color below
        if #available(iOS 13, *) {
            return .systemBackground
        }
        return UIColor(hex: "#F8F8F8")
    }
}
