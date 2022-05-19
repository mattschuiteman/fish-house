//
//  BreakoutBoardView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/16/21.
//

import SwiftUI

struct BreakoutBoardView: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    @ObservedObject var weights: FishHouseWeights
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    var body: some View {
        
        GeometryReader { geo in
        
            BreakoutBoardDataView(requests: requests, weights: weights, add_ons: add_ons, geometryHeight: geo.size.height, geometryWidth: geo.size.width)
            
        }
    }
}

struct BreakoutBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BreakoutBoardView(requests: FishHouseRequests(), weights: FishHouseWeights(), add_ons: FishHouseAddOns())
                .position(x: 350, y:200)
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
