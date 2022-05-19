//
//  SquidStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/1/22.
//

import SwiftUI

struct SquidStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            
            TopTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Squid")
            
            ShowSquid(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            PointSquid(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            PinnSquid(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            OtterSquid(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            WhaleSquid(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            AqSquid(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            RescueSquid(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            WildSquid(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
        }
    }
}

struct SquidStack_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geo in
            SquidStack(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
    }
}
