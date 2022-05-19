//
//  BreakoutMackStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/13/22.
//

import SwiftUI

struct BreakoutMackStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    @ObservedObject var weights: FishHouseWeights
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    let mack: String = "mack"
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let factor: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            
            SingleNumberOfBoxes(add_ons: add_ons, fish: mack, boxesPerRack: requests.getBoxesPerRack(fish: mack, boxWeight: weights.findWeight(name: mack), addOn: add_ons.findAddOn(name: mack)), color: Color.red, topTitle: "Mackerel", totalBoxes: requests.getNumberOfBoxes(fish: mack, boxWeight: weights.findWeight(name: mack), addOn: add_ons.findAddOn(name: mack)), geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            TotalLBS(poundsNeeded: requests.totalPoundsNeeded(fish: mack), color: Color.red, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            TotalLBS(poundsNeeded: requests.totalPoundsBrokeout(fish: mack, boxWeight: weights.findWeight(name: mack), addOn: add_ons.findAddOn(name: mack)), color: Color.red, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            SingleWeightOfBoxes(weights: weights, name: mack, boxWeight: weights.findWeight(name: mack), boxWeightInput: weights.findWeight(name: mack), color: Color.red, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
        }
    }
}

struct BreakoutMackStack_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BreakoutMackStack(requests: FishHouseRequests(), weights: FishHouseWeights(), add_ons: FishHouseAddOns(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
    }
}
