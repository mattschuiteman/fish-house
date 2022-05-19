//
//  SideTitleViews.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/31/21.
//

import SwiftUI

struct SideTitleViews: View {
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            TopTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "")
            
            SideTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "B.H.")
            
            SideTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "D.P.")
            
            SideTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Pinn.")
            
            SideTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Otter")
            
            SideTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Shamu")
            
            SideTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Aquarium")
            
            SideTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "Rescue")
            
            SideTitleView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, title: "W.A.")
                
        }
        
    }
}

struct SideTitleViews_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geo in
            SideTitleViews(geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
