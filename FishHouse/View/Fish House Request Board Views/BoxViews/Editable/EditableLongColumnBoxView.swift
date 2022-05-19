//
//  EditableLongColumnBoxView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/16/21.
//

import SwiftUI

struct EditableLongColumnBoxView: View {
    
    @ObservedObject var fishHouseRequests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let leftName: String
    let rightName: String
    
    @State var leftRequestedWeightInput: Int
    @State var rightRequestedWeightInput: Int
    
    let leftRequestedWeight: Int
    let rightRequestedWeight: Int
    
    let leftColor: Color
    let rightColor: Color
    
    let rightTitle: String
    
    var viewHeight: CGFloat {
        geometryHeight * 0.4
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.4
    }
    
    var leftCalculatedWeight: Int {
        leftRequestedWeight / fullBucket
    }

    var leftLeftoverWeight: Int {

        leftRequestedWeight % fullBucket
    }
    
    var rightCalculatedWeight: Int {
        rightRequestedWeight / fullBucket
    }

    var rightLeftoverWeight: Int {

        rightRequestedWeight % fullBucket
    }
    
    var body: some View {
        
        ZStack {
            
            RectangleLongColumn()
                .stroke(lineWidth: 6.0)
                .frame(width: viewWidth, height: viewHeight, alignment: .center)
                .overlay(alignment: .topLeading, content: {
                    
                    ZStack {
                    
                        Rectangle()
                            .frame(width: viewWidth * viewWidthRatio, height: viewHeight * viewHeightRatio, alignment: .topLeading)
                            .foregroundColor(.white)
                    
                        RectangleHalvedWithTriangle()
                            .stroke(.black, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                            .frame(width: viewWidth * viewWidthRatio, height: viewHeight * viewHeightRatio, alignment: .topLeading)
                            .overlay(
                        
                                ZStack {
                                    TextField("\(leftRequestedWeight)", value: $leftRequestedWeightInput, format: .number)
                                        .keyboardType(.numberPad)
                                        .font(.system(size: fontSizeSmall))
                                        .padding(.bottom, topTopPadding)
                                        .padding(.trailing, 12.5)
                                        .foregroundColor(leftColor)
                                        .onChange(of: leftRequestedWeightInput) {newValue in
                                            print(newValue)
                                            fishHouseRequests.updateData(requestToUpdateID: leftName, updatedAmount: newValue)
                                        }
                            
                                    TextField("\(rightRequestedWeight)", value: $rightRequestedWeightInput, format: .number)
                                        .keyboardType(.numberPad)
                                        .font(.system(size: fontSizeSmall))
                                        .padding(.top, topTopPadding)
                                        .padding(.leading, 75.0)
                                        .foregroundColor(rightColor)
                                        ._tightPadding()
                                        .onChange(of: rightRequestedWeightInput) {newValue in
                                            print(newValue)
                                            fishHouseRequests.updateData(requestToUpdateID: rightName, updatedAmount: newValue)
                                        }

                            
                                }
                            )
                
                    }
                })
            
            Text("\(rightTitle)")
                .font(.system(size: fontSizeSmall))
                .foregroundColor(rightColor)
                .padding(.bottom, rightTitlePadding)
                .padding(.leading, horizontalPadding)
            
            
            if (leftLeftoverWeight == 0 && leftCalculatedWeight != 0) {
                Text("\(leftCalculatedWeight)")
                        .font(.system(size: fontSizeLarge))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.trailing, horizontalPadding)
                        .foregroundColor(leftColor)
            }
            
            else if (leftLeftoverWeight != 0 && leftCalculatedWeight == 0)
            {
                Text("\(leftLeftoverWeight)#")
                        .font(.system(size: fontSizeLarge))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.trailing, horizontalPadding)
                        .foregroundColor(leftColor)
            }
            
            else if (leftLeftoverWeight == 0 && leftCalculatedWeight == 0)
            {
                Text("")
                        .font(.system(size: fontSizeLarge))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.trailing, horizontalPadding)
                        .foregroundColor(leftColor)
            }
            
            else {
                Text("\(leftCalculatedWeight) + \(leftLeftoverWeight)#")
                    .font(.system(size: fontSizeSmall))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.trailing, horizontalPadding)
                        .foregroundColor(leftColor)
            }
            
            if (rightLeftoverWeight == 0 && rightCalculatedWeight != 0) {
                Text("\(rightCalculatedWeight)")
                        .font(.system(size: fontSizeLarge))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.leading, horizontalPadding)
                        .foregroundColor(rightColor)
            }
            
            else if (rightLeftoverWeight != 0 && rightCalculatedWeight == 0)
            {
                Text("\(rightLeftoverWeight)#")
                        .font(.system(size: fontSizeLarge))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.leading, horizontalPadding)
                        .foregroundColor(rightColor)
            }
            
            else if (rightCalculatedWeight == 0 && rightLeftoverWeight == 0)
            {
                Text("")
                        .font(.system(size: fontSizeLarge))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.leading, horizontalPadding)
                        .foregroundColor(rightColor)
            }
            
            else {
                Text("\(rightCalculatedWeight) + \(rightLeftoverWeight)#")
                    .font(.system(size: fontSizeSmall))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.leading, horizontalPadding)
                        .foregroundColor(rightColor)
            }
            
        }
        
    }
    
    //MARK: - Control Panel
    
    let fullBucket: Int = 25
    
    let viewWidthRatio: CGFloat = 0.5
    let viewHeightRatio: CGFloat = 0.5
    
    let fontSizeLarge: CGFloat = 50.0
    let fontSizeSmall: CGFloat = 25.0
    let megaFontSize: CGFloat = 75.0
    
    let verticalPadding: CGFloat = 60.0
    let horizontalPadding: CGFloat = 125.0
    
    let triangleBoxHorizontalPadding: CGFloat = 50.0
    
    let rightTitlePadding: CGFloat = 85.0
    
    let topTopPadding: CGFloat = 35.0
    
}

struct EditableLongColumnBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader {geo in
            EditableLongColumnBoxView(fishHouseRequests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width, leftName: "show_pac", rightName: "show_atl",leftRequestedWeightInput: 199, rightRequestedWeightInput: 20, leftRequestedWeight: 199, rightRequestedWeight: 20, leftColor: .purple, rightColor: .red, rightTitle: "ATH")
                .position(x: 200, y: 200)
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
