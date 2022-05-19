//
//  BreakoutSardsStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/13/22.
//

import SwiftUI

struct BreakoutSardsStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    @ObservedObject var weights: FishHouseWeights
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    let sards: String = "sards"
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let factor: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            
            SingleNumberOfBoxes(add_ons: add_ons, fish: sards, boxesPerRack: requests.getBoxesPerRack(fish: sards, boxWeight: weights.findWeight(name: sards), addOn: add_ons.findAddOn(name: sards)), color: Color.orange, topTitle: "Sardines", totalBoxes: requests.getNumberOfBoxes(fish: sards, boxWeight: weights.findWeight(name: sards), addOn: add_ons.findAddOn(name: sards)), geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            TotalLBS(poundsNeeded: requests.totalPoundsNeeded(fish: sards), color: Color.orange, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            TotalLBS(poundsNeeded: requests.totalPoundsBrokeout(fish: sards, boxWeight: weights.findWeight(name: sards), addOn: add_ons.findAddOn(name: sards)), color: Color.orange, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            SingleWeightOfBoxes(weights: weights, name: sards, boxWeight: weights.findWeight(name: sards), boxWeightInput: weights.findWeight(name: sards), color: Color.orange, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
        }
    }
}

struct BreakoutSardsStack_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BreakoutSardsStack(requests: FishHouseRequests(), weights: FishHouseWeights(), add_ons: FishHouseAddOns(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
    }
}
