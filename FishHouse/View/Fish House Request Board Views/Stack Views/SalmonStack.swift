//
//  SalmonStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/1/22.
//

import SwiftUI

struct SalmonStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let name: String = "whale_salmon"
    
    var body: some View {
        VStack(spacing: 0){
            TopTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Salmon")
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            NavigationLink(destination: EditableSimpleBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, name: name, color: Color.gray, requestedWeight: requests.findWeight(name: name), requestedWeightInput: requests.findWeight(name: name)))
            {
                SimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, color: Color.gray, requestedWeight: requests.findWeight(name: name))
            }
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
        }
    }
}
