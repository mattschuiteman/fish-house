//
//  RectangleCutInHalf.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/6/22.
//

import SwiftUI

struct RectangleCutInHalf: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        //SIMPLE RECTANGLE
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        //MOVE TO MIDDLE AND CUT THROUGH
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        
        return path
    }
}
