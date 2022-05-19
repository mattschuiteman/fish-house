//
//  CaplinStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/31/21.
//

import SwiftUI

struct CapelinStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TopTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Capelin")
            
            ShowCapelin(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            PointCapelin(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            PinnCapelin(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            WhaleCapelin(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            AqCapelin(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            RescueCapelin(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            WildCapelin(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            
        }
    }
}

struct CapelinStack_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            CapelinStack(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
