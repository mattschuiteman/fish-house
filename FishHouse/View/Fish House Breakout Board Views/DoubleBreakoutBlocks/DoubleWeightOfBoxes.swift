//
//  HerringWeightOfBoxes.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/6/22.
//

import SwiftUI

struct DoubleWeightOfBoxes: View {
    
    @ObservedObject var weights: FishHouseWeights
    
    let leftName: String
    let leftBoxWeight: Int
    @State var leftBoxWeightInput: Int
    let leftColor: Color
    
    let rightName: String
    let rightBoxWeight: Int
    @State var rightBoxWeightInput: Int
    let rightColor: Color
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight * 0.2
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.15
    }
    
    var body: some View {
        RectangleHalvedWithTriangle()
            .stroke(lineWidth: 2)
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
            .overlay(
                TextField("\(leftBoxWeight)", value: $leftBoxWeightInput, format: .number)
                    .keyboardType(.numberPad)
                    .font(.system(size: 20))
                    .padding(.bottom, 45)
                    .padding(.trailing, 75)
                    .foregroundColor(leftColor)
                    ._tightPadding()
                    .onChange(of: leftBoxWeightInput) {newValue in
                        print(newValue)
                        weights.updateWeight(requestToUpdateID: leftName, updatedAmount: newValue)
                    }
            )
            .overlay(
                TextField("\(rightBoxWeight)", value: $rightBoxWeightInput, format: .number)
                    .font(.system(size: 20))
                    .padding(.top, 45)
                    .padding(.leading, 75)
                    .foregroundColor(rightColor)
                    ._tightPadding()
                    .onChange(of: rightBoxWeightInput) {newValue in
                        print(newValue)
                        weights.updateWeight(requestToUpdateID: rightName, updatedAmount: newValue)
                    }

            )
    }
}

struct DoubleWeightOfBoxes_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            DoubleWeightOfBoxes(weights: FishHouseWeights(), leftName: "pac", leftBoxWeight: 25, leftBoxWeightInput: 25, leftColor: Color.purple,rightName: "atl", rightBoxWeight: 25, rightBoxWeightInput: 25, rightColor: Color.burgundy, geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
