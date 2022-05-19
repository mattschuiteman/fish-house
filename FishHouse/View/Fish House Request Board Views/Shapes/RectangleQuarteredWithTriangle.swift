//
//  RectangleQuarteredWithTriangle.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/14/21.
//

import SwiftUI


struct RectangleQuarteredWithTriangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        
    var path = Path()

    path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    //path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))

    path.addLine(to: CGPoint(x: rect.midX + (5 * rect.midX.squareRoot()), y: rect.midY))
        
    return path
    
    }
    
}
