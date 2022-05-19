//
//  SardinesStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/1/22.
//

import SwiftUI

struct SardinesStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            TopTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Sardines")
            
            ShowSards(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            PointSards(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            PinnSards(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            WhaleSards(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            AqSards(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            RescueSards(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            WildSards(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
        }
    }
}

struct SardinesStack_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geo in
            SardinesStack(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
    }
}
