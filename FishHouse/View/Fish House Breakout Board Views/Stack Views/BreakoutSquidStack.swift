//
//  BreakoutSquidStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/13/22.
//

import SwiftUI

struct BreakoutSquidStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    @ObservedObject var weights: FishHouseWeights
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let ilex: String = "big"
    let loligo: String = "little"
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            DoubleNumberOfBoxes(add_ons: add_ons, topFish: loligo, bottomFish: ilex, topBoxesPerRack: requests.getBoxesPerRack(fish: loligo, boxWeight: weights.findWeight(name: loligo), addOn: add_ons.findAddOn(name: loligo)), bottomBoxesPerRack: requests.getBoxesPerRack(fish: ilex, boxWeight: weights.findWeight(name: ilex), addOn: add_ons.findAddOn(name: ilex)), topTitle: "Squid", topSubtitle: "Little", totalBoxesTop: requests.getNumberOfBoxes(fish: loligo, boxWeight: weights.findWeight(name: loligo), addOn: add_ons.findAddOn(name: loligo)), bottomSubtitle: "Big", totalBoxesBottom: requests.getNumberOfBoxes(fish: ilex, boxWeight: weights.findWeight(name: ilex), addOn: add_ons.findAddOn(name: ilex)), leftColor: Color.blue, rightColor: Color.green, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            DoubleTotalLBS(leftPoundsNeeded: requests.totalPoundsNeeded(fish: loligo), rightPoundsNeeded: requests.totalPoundsNeeded(fish: ilex), leftColor: Color.blue, rightColor: Color.green, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            DoubleTotalLBS(leftPoundsNeeded: requests.totalPoundsBrokeout(fish: loligo, boxWeight: weights.findWeight(name: loligo), addOn: add_ons.findAddOn(name: loligo)), rightPoundsNeeded: requests.totalPoundsBrokeout(fish: ilex, boxWeight: weights.findWeight(name: ilex), addOn: add_ons.findAddOn(name: ilex)), leftColor: Color.blue, rightColor: Color.green, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            DoubleWeightOfBoxes(weights: weights, leftName: loligo, leftBoxWeight: weights.findWeight(name: loligo), leftBoxWeightInput: weights.findWeight(name: loligo), leftColor: Color.blue, rightName: ilex, rightBoxWeight: weights.findWeight(name: ilex), rightBoxWeightInput: weights.findWeight(name: ilex), rightColor: Color.green, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
        }
    }
}


