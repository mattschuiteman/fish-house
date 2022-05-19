//
//  SingleWeightOfBoxes.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/13/22.
//

import SwiftUI

struct SingleWeightOfBoxes: View {
    
    @ObservedObject var weights: FishHouseWeights
    
    let name: String
    let boxWeight: Int
    @State var boxWeightInput: Int
    let color: Color
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight * 0.2
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.15
    }
    
    var body: some View {
        Rectangle()
            .stroke(lineWidth: 2)
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
            .overlay(
                TextField("\(boxWeight)#", value: $boxWeightInput, format: .number)
                    .keyboardType(.numberPad)
                    .foregroundColor(color)
                    .font(.system(size: 40))
                    .padding(.leading, 35)
                    .onChange(of: boxWeightInput) {newValue in
                        print(newValue)
                        weights.updateWeight(requestToUpdateID: name, updatedAmount: newValue)
                    }
            )
        
    }
}

struct SingleWeightOfBoxes_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            SingleWeightOfBoxes(weights: FishHouseWeights(), name: "capelin", boxWeight: 34, boxWeightInput: 34, color: Color.blue, geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
