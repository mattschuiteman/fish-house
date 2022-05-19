//
//  HerringNumberOfBoxes.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/6/22.
//

import SwiftUI

struct DoubleNumberOfBoxes: View {
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    let topFish: String
    let bottomFish: String
    
    var topBoxesPerRack: [Int]
    var bottomBoxesPerRack: [Int]
    
    let topTitle: String
    let topSubtitle: String
    let totalBoxesTop: Int
    
    let bottomSubtitle: String
    let totalBoxesBottom: Int
    
    let leftColor: Color
    let rightColor: Color
    
    var addOnBoxes: Int = 0
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight * 0.4
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.15
    }
    
    var textWidth: CGFloat {
        viewWidth * 0.3
    }

    var textHeight: CGFloat {
        viewHeight * 1.5
    }
    
    var body: some View {
        RectangleCutInHalf()
            .stroke(lineWidth: 2)
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
            .overlay(
                VStack {
                    Text("\(topTitle)")
                    
                    if (totalBoxesTop >= 12) {
                   
                        HStack {
                            
                            if (add_ons.findAddOn(name: topFish)) {
                                
                                Image(systemName: "exclamationmark.circle.fill")
                                    .font(.system(size: 12.5))
                                    .foregroundColor(Color.yellow)
                                
                            }
                            
                            Text("\(topSubtitle)")
                                .bold()
                                .underline()
                                .font(.system(size: 12.5))
                            
                            if (totalBoxesTop >= 14) {
                                Text("\(totalBoxesTop)")
                                    .font(.system(size: 12.5))
                                    .foregroundColor(leftColor)
                            }
                            
                            else {
                                
                                Text("\(totalBoxesTop)")
                                    .font(.system(size: 25))
                                    .foregroundColor(leftColor)
                                
                            }
                        }
                        
                    }
                    
                    
                    ForEach(topBoxesPerRack, id: \.self) {boxes in
                        
                        if (topBoxesPerRack.count == 1) {
                            Text("\(boxes)")
                                .foregroundColor(leftColor)
                                .font(.system(size: 25))

                        }
                        
                        else {
                        
                            Text("\(boxes)")
                                .foregroundColor(leftColor)
                                .font(.system(size: 12.5))
                        }
                    }
                    
                    if (addOnBoxes > 0) {
                        Text("+ \(addOnBoxes) in box")
                            .foregroundColor(leftColor)
                            .font(.system(size: 12.5))
                    }
                    
                }
                    .padding(.bottom, 80)
            )
        .overlay(
            VStack {
                
                
                if totalBoxesBottom >= 14 {

                    HStack {
                        Text("\(bottomSubtitle)")
                            .bold()
                            .underline()
                            .font(.system(size: 12.5))
                        
                        Text("\(totalBoxesBottom)")
                            .font(.system(size: 12.5))
                            .foregroundColor(rightColor)
                    }
                    
                    ForEach(bottomBoxesPerRack, id: \.self) {rack in
                        Text("\(rack)")
                            .foregroundColor(rightColor)
                            .font(.system(size: 12.5))
                    }
                    
                }
                
                else {
                    
                    if (add_ons.findAddOn(name: bottomFish)) {
                        
                        Image(systemName: "exclamationmark.circle.fill")
                            .font(.system(size: 12.5))
                            .foregroundColor(Color.yellow)
                        
                    }
                    
                    Text("\(bottomSubtitle)")
                        .bold()
                        .underline()
                        .font(.system(size: 15))
                
                    ForEach(bottomBoxesPerRack, id: \.self) {rack in
                        Text("\(rack)")
                            .foregroundColor(rightColor)
                            .font(.system(size: 25))
                    }
                    
                }
                
            }
                .padding(.top, 80)
        )
    }
}

struct DoubleNumberOfBoxes_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            DoubleNumberOfBoxes(add_ons: FishHouseAddOns(), topFish: "pac", bottomFish: "atl", topBoxesPerRack: [7], bottomBoxesPerRack: [7], topTitle: "Herring", topSubtitle: "PAC", totalBoxesTop: 7, bottomSubtitle: "ATL", totalBoxesBottom: 7, leftColor: Color.purple, rightColor: Color.red, geometryHeight: geo.size.height, geometryWidth: geo.size.width)
                .position(x: 100, y: 100)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
