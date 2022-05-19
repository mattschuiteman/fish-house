//
//  BreakoutHerringStack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/10/22.
//

import SwiftUI

struct BreakoutHerringStack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    @ObservedObject var weights: FishHouseWeights
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    let pac: String = "pac"
    let atl: String = "atl"
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var body: some View {
        
        
        
        VStack (spacing: 0) {
            
            DoubleNumberOfBoxes(add_ons: add_ons, topFish: pac, bottomFish: atl, topBoxesPerRack: requests.getBoxesPerRack(fish: pac, boxWeight: weights.findWeight(name: pac), addOn: add_ons.findAddOn(name: pac)), bottomBoxesPerRack: requests.getBoxesPerRack(fish: atl, boxWeight: weights.findWeight(name: atl), addOn: add_ons.findAddOn(name: atl)), topTitle: "Herring", topSubtitle: "PAC:", totalBoxesTop: requests.getNumberOfBoxes(fish: pac, boxWeight: weights.findWeight(name: pac), addOn: add_ons.findAddOn(name: pac)), bottomSubtitle: "ATL", totalBoxesBottom: requests.getNumberOfBoxes(fish: atl, boxWeight: weights.findWeight(name: atl), addOn: add_ons.findAddOn(name: atl)), leftColor: Color.purple, rightColor: Color.burgundy, addOnBoxes: requests.findExtraWeightInBoxes(boxWeight: weights.findWeight(name: pac)), geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            DoubleTotalLBS(leftPoundsNeeded: requests.totalPoundsNeeded(fish: pac), rightPoundsNeeded: requests.totalPoundsNeeded(fish: atl), leftColor: Color.purple, rightColor: Color.burgundy, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            DoubleTotalLBS(leftPoundsNeeded: requests.totalPoundsBrokeout(fish: pac, boxWeight: weights.findWeight(name: pac), addOn: add_ons.findAddOn(name: pac)), rightPoundsNeeded: requests.totalPoundsBrokeout(fish: atl, boxWeight: weights.findWeight(name: atl), addOn: add_ons.findAddOn(name: atl)), leftColor: Color.purple, rightColor: Color.burgundy, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
            DoubleWeightOfBoxes(weights: weights,
                                leftName: pac,
                                leftBoxWeight: weights.findWeight(name: pac),
                                leftBoxWeightInput: weights.findWeight(name: pac), leftColor: Color.purple, rightName: atl, rightBoxWeight: weights.findWeight(name: atl), rightBoxWeightInput: weights.findWeight(name: atl), rightColor: Color.burgundy, geometryHeight: geometryHeight, geometryWidth: geometryWidth)
            
        }
    }
}

struct BreakoutHerringStack_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BreakoutHerringStack(requests: FishHouseRequests(), weights: FishHouseWeights(), add_ons: FishHouseAddOns(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
