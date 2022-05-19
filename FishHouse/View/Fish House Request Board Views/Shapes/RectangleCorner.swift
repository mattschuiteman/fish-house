//
//  RectangleCorner.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/4/22.
//

import SwiftUI

struct RectangleCorner: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        //SIMPLE RECTANGLE
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        //MOVE FROM BOTTOM MIDDLE OF RECTANLGE TO MIDDLE RIGHT OF RECTANGLE TO CREATE CORNER
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        
        return path
    }
}
