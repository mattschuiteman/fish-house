//
//  Color.swift
//  Breezy
//
//  Created by Matthew Schuiteman on 10/11/20.
//

import SwiftUI

extension Color {
    
    static var fishHouseColor:      Color { .rgb(2, 8, 135)}
    
    static var burgundy:        Color { .rgb(108, 14, 35)     }
 
    static var capelin:        Color { .rgb(0,128,128)     }
    
    static var large: Color {.rgb(5,195,221)}
}

extension Color {
    static func rgb(_ red: UInt8, _ green: UInt8, _ blue: UInt8) -> Color {
        func value(_ raw: UInt8) -> Double {
            return Double(raw)/Double(255)
        }
        return Color(
            red: value(red),
            green: value(green),
            blue: value(blue)
        )
    }
}
