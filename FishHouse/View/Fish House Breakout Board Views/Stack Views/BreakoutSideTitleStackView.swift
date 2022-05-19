//
//  BreakoutSideTitleStackView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/4/22.
//

import SwiftUI

struct BreakoutSideTitleStackView: View {
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var body: some View {
        
        VStack(spacing: 0) {
        
            BreakoutLongTitleView(topText: "#", middleText: "of", bottomText: "BOXES", geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            BreakoutTitleView(topText: "Total", middleText: "lbs", bottomText: "Needed", geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            BreakoutTitleView(topText: "Total", middleText: "lbs", bottomText: "Brokeout", geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            BreakoutTitleView(topText: "Weight", middleText: "of", bottomText: "Boxes", geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
        }
    }
}
