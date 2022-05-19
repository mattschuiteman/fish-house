//
//  ShrimpStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/1/22.
//

import SwiftUI

struct ShrimpStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let name: String = "pinn_shrimp"
    
    var body: some View {
        VStack(spacing: 0){
            TopTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Shrimp")
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            NavigationLink(destination: EditableSimpleBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, name: name, color: Color.pink, requestedWeight: requests.findWeight(name: name), requestedWeightInput: requests.findWeight(name: name)))
            {
                SimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, color: Color.pink, requestedWeight: requests.findWeight(name: name))
            }
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
        }
    }
}
