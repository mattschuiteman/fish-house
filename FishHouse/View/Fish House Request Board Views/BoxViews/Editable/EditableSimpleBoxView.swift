//
//  EditableSimpleBoxView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/16/21.
//

import SwiftUI

struct EditableSimpleBoxView: View {
    
    @ObservedObject var fishHouseRequests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let name: String
    
    let color: Color
    
    let requestedWeight: Int
    
    @State var requestedWeightInput: Int
    
    var viewHeight: CGFloat {
        geometryHeight * 0.5
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.5
    }
    
    var calculatedWeight: Int {
        requestedWeight / fullBucket
    }
    
    var leftoverWeight: Int {
        
        requestedWeight % fullBucket
    }
    
    
    var body: some View {
        
    
        ZStack {
    
            Rectangle()
                .strokeBorder(.black, lineWidth: 6)
                .frame(width: viewWidth, height: viewHeight, alignment: .center)
                .overlay(
                    ZStack {
                        if (calculatedWeight != 0 && leftoverWeight == 0) {
                            Text("\(calculatedWeight)")
                                .font(.system(size: 50))
                                .padding(.top, paddingRatio)
                                .foregroundColor(color)
                        }
                        
                        else if (calculatedWeight == 0 && leftoverWeight != 0){
                            Text("\(leftoverWeight)#")
                                .font(.system(size: 50))
                                .padding(.top, paddingRatio)
                                .foregroundColor(color)
                        }
                        
                        else if (calculatedWeight == 0 && leftoverWeight == 0){
                            Text("")
                                .font(.system(size: 50))
                                .padding(.top, paddingRatio)
                                .foregroundColor(color)
                        }
                                    
                        else {
                            Text("\(calculatedWeight) + \(leftoverWeight)#")
                                .font(.system(size: 50))
                                .padding(.top, paddingRatio)
                                .foregroundColor(color)
                        }

                    }
                )
                .background(alignment: .topLeading, content: {
                    Rectangle()
                        .strokeBorder(.black, lineWidth: 6)
                        .frame(width: viewWidth * 0.65, height: viewHeight * 0.50, alignment: .topLeading)
                        .overlay(
                            TextField("\(requestedWeight)", value: $requestedWeightInput, format: .number)
                                .font(.system(size: 50))
                                .keyboardType(.numberPad)
                                .foregroundColor(color)
                                ._tightPadding()
                                .onChange(of: requestedWeightInput) {newValue in
                                    print(newValue)
                                    fishHouseRequests.updateData(requestToUpdateID: name, updatedAmount: newValue)
                                }
                        )
                })
            
        }
        
    }
    
    let fullBucket: Int = 25
    let paddingRatio: CGFloat = 75
}

struct EditableSimpleBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader {geometry in
        
            EditableSimpleBoxView(fishHouseRequests: FishHouseRequests(), geometryHeight: geometry.size.height, geometryWidth: geometry.size.width, name: "show_pac", color: Color.red, requestedWeight: 200, requestedWeightInput: 200)
            
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
