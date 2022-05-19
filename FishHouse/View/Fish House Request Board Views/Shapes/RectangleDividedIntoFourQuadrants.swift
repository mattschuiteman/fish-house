//
//  RectangleDividedInto4Quadrants.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/14/21.
//

import SwiftUI

struct RectangleDividedIntoFourQuadrants: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        //SIMPLE RECTANGLE
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        //CUT IN HALF
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}
