//
//  SingleNumberOfBoxes.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/12/22.
//

import SwiftUI

struct SingleNumberOfBoxes: View {
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    let fish: String
    
    var boxesPerRack: [Int]
    
    let color: Color
    
    let topTitle: String

    let totalBoxes: Int
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight * 0.4
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.15
    }
    
    var body: some View {
        Rectangle()
            .stroke(lineWidth: 2)
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
            .overlay(
                VStack(spacing: 0) {
                    Text("\(topTitle)")
                        //.padding(.bottom, 20)
                    
                    HStack {
                        
                        if (add_ons.findAddOn(name: fish)) {
                            Image(systemName: "exclamationmark.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(Color.yellow)
                            
                            if (totalBoxes >= 14) {
                                Text("\(totalBoxes)")
                                    .font(.system(size: 20))
                                    .foregroundColor(color)
                                
                            }
                        }
                        
                        else {
                        
                            if (totalBoxes >= 14) {
                                Text("\(totalBoxes)")
                                    .font(.system(size: 20))
                                    .foregroundColor(color)
                                    .padding(.leading, 50)
                            }
                            
                        }
                        
                    }
                    
                    if (totalBoxes >= 14) {
                        ForEach(boxesPerRack, id: \.self) {boxes in
                            Text("\(boxes)")
                                .foregroundColor(color)
                                .font(.system(size: 20))
                        }
                    }
                    
                    else {
                        
                        ForEach(boxesPerRack, id: \.self) {boxes in
                            Text("\(boxes)")
                                .foregroundColor(color)
                                .font(.system(size: 30))
                        }
                        
                    }
                }
            )
    }
}

struct SingleNumberOfBoxes_Previews: PreviewProvider {
    
    static var previews: some View {
        GeometryReader { geo in
            SingleNumberOfBoxes(add_ons: FishHouseAddOns(), fish: "capelin", boxesPerRack: [8, 8, 7], color: Color.blue, topTitle: "Capelin", totalBoxes: 23, geometryHeight: geo.size.height, geometryWidth: geo.size.width)
            
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
