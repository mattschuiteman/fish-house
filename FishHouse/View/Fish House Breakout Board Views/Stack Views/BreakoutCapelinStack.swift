//
//  CapelinStackView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/13/22.
//

import SwiftUI

struct BreakoutCapelinStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    @ObservedObject var weights: FishHouseWeights
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let cape: String = "capelin"
    
    let factor: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            
            SingleNumberOfBoxes(add_ons: add_ons, fish: cape, boxesPerRack: requests.getBoxesPerRack(fish: cape, boxWeight: weights.findWeight(name: cape), addOn: add_ons.findAddOn(name: cape)), color: Color.capelin, topTitle: "Capelin", totalBoxes: requests.getNumberOfBoxes(fish: cape, boxWeight: weights.findWeight(name: cape), addOn: add_ons.findAddOn(name: cape)), geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            TotalLBS(poundsNeeded: requests.totalPoundsNeeded(fish: "capelin"), color: Color.capelin, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            TotalLBS(poundsNeeded: requests.totalPoundsBrokeout(fish: cape, boxWeight: weights.findWeight(name: cape), addOn: add_ons.findAddOn(name: cape)), color: Color.capelin, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            SingleWeightOfBoxes(weights: weights, name: cape, boxWeight: weights.findWeight(name: cape), boxWeightInput: weights.findWeight(name: cape), color: Color.capelin, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
        }
    }
}

struct CapelinStackView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BreakoutCapelinStack(requests: FishHouseRequests(), weights: FishHouseWeights(), add_ons: FishHouseAddOns(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
    }
}
