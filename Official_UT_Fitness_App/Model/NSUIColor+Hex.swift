//
//  NSUIColor+Hex.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2022-12-21.
//

import Foundation
import Charts

extension NSUIColor{
    convenience init(red: Int, green: Int, blue: Int){
        assert(red >= 0 && red <= 255, "Invalid red component in hexcode")
        assert(green >= 0 && green <= 255, "Invalid green component in hexcode")
        assert(blue >= 0 && blue <= 255, "Invalid blue component in hexcode")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        
    }
    
    convenience init(hex: Int){
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF)
    }
    
}
