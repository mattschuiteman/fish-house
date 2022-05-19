//
//  BreakoutBoardDataView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/3/22.
//

import SwiftUI

struct BreakoutBoardDataView: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    @ObservedObject var weights: FishHouseWeights
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var body: some View {
        
        Group {
        
            HStack(spacing: 0) {
                
                BreakoutSideTitleStackView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
                
                BreakoutHerringStack(requests: requests, weights: weights, add_ons: add_ons, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
                
                BreakoutCapelinStack(requests: requests, weights: weights, add_ons: add_ons, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
                
                BreakoutMackStack(requests: requests, weights: weights, add_ons: add_ons, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
                
                BreakoutSardsStack(requests: requests, weights: weights, add_ons: add_ons, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
                
                BreakoutSquidStack(requests: requests, weights: weights, add_ons: add_ons, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
                
            }
            .padding(.top)
            .padding(.bottom, 40)
            .padding(.leading)
            
        }
        
    }
}

struct BreakoutBoardDataView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BreakoutBoardDataView(requests: FishHouseRequests(), weights: FishHouseWeights(), add_ons: FishHouseAddOns(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
