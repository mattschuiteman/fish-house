//
//  HerringStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/31/21.
//

import SwiftUI

struct HerringStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            TopTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Herring")
            
            NavigationLink(
                           destination: ShowHerring(requests: requests,
                                                    geometryHeight: geometryHeight,
                                                    geometryWidth: geometryWidth,
                                                    isEditable: true))
            {
                ShowHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: false)
                
            }
            
            NavigationLink(destination: PointHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: true))
            {
                PointHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: false)
            }
            
            
            NavigationLink(destination: PinnHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: true))
            {
                PinnHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: false)
                
            }
            
            EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            NavigationLink(destination: WhaleHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: true))
            {
                WhaleHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: false)
            }
            
            NavigationLink(destination: AqHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: true))
            {
                AqHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: false)
            }
            
            NavigationLink(destination: RescueHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: true))
            {
                RescueHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: false)
            }
            
            NavigationLink(destination: WildHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: true))
            {
                WildHerring(requests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, isEditable: false)
            }
            
            
        }
        
    }
}

struct HerringStack_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geo in
            HerringStack(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
            
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
