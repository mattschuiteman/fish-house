//
//  ReactangleLongColumn.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/17/21.
//

import SwiftUI

struct RectangleLongColumn: Shape {
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
        
        //Only draw half the line
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}
