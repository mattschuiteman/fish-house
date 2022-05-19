//
//  MackerelStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/1/22.
//

import SwiftUI

struct MackerelStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            
            TopTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Mackerel")
            
            ShowMack(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            PointMack(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            PinnMack(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            WhaleMack(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            AqMack(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            RescueMack(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            WildMack(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
        }
    }
}

struct MackerelStack_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            MackerelStack(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
    }
}
