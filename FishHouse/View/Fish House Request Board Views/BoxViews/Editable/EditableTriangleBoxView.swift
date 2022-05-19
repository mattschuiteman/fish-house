//
//  EditableTriangleBoxView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/16/21.
//

import SwiftUI

struct EditableTriangleBoxView: View {
    
    @ObservedObject var fishHouseRequests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let leftColor: Color
    let rightColor: Color
    
    let leftName: String
    let leftRequestedWeight: Int
    @State var leftRequestedWeightInput: Int
    
    let rightName: String
    let rightRequestedWeight: Int
    @State var rightRequestedWeightInput: Int
    
    var viewHeight: CGFloat {
        geometryHeight * viewHeightMultiplier
    }
    
    var viewWidth: CGFloat {
        geometryWidth * viewWidthMultiplier
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
        
        RectangleQuarteredWithTriangle()
            .stroke(.black, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
        
            .overlay(
                
                ZStack {
                
                    ZStack {
                        
                        if leftLeftoverWeight == 0 && leftCalculatedWeight != 0 {
                            Text("\(leftCalculatedWeight)")
                                .bold()
                                .font(.system(size: fontSizeLarge))
                                .padding(.top, bottomTopPaddingSingleLeft)
                                .padding(.trailing, bottomTrailingPaddingSingleLeft)
                                .foregroundColor(leftColor)
                        }
                        
                        else if leftLeftoverWeight != 0 && leftCalculatedWeight == 0 {
                            Text("\(leftLeftoverWeight)#")
                                .bold()
                                .font(.system(size: fontSizeLarge))
                                .padding(.top, bottomTopPaddingSingleLeft)
                                .padding(.trailing, bottomTrailingPaddingSingleLeft)
                                .foregroundColor(leftColor)
                        }
                        
                        else if leftLeftoverWeight == 0 && leftCalculatedWeight == 0 {
                                Text("")
                                    .bold()
                                    .font(.system(size: fontSizeLarge))
                                    .padding(.top, bottomTopPaddingSingleLeft)
                                    .padding(.trailing, bottomTrailingPaddingSingleLeft)
                                    .foregroundColor(leftColor)
                        }
                        
                        
                        else {
                            Text("\(leftCalculatedWeight) + \(leftLeftoverWeight)#")
                                .bold()
                                .font(.system(size: fontSizeSmaller))
                                .padding(.top, bottomTopPaddingDoubleLeft)
                                .padding(.trailing, bottomTrailingPaddingDoubleLeft)
                                .foregroundColor(leftColor)
                        }
                        
                    }
                    
                    ZStack {
                        
                        if rightLeftoverWeight == 0 && rightCalculatedWeight != 0 {
                            Text("\(rightCalculatedWeight)")
                                .bold()
                                .font(.system(size: fontSizeLarge))
                                .padding(.top, bottomTopPaddingSingleRight)
                                .padding(.leading, bottomLeadingPaddingSingleRight)
                                .foregroundColor(rightColor)

                        }
                        
                        else if rightLeftoverWeight != 0 && rightCalculatedWeight == 0 {
                            Text("\(rightLeftoverWeight)#")
                                .bold()
                                .font(.system(size: fontSizeLarge))
                                .padding(.top, bottomTopPaddingSingleRight)
                                .padding(.leading, bottomLeadingPaddingSingleRight)
                                .foregroundColor(rightColor)
                        }
                        
                        else if (rightLeftoverWeight == 0 && rightCalculatedWeight == 0) {
                            Text("")
                                .bold()
                                .font(.system(size: fontSizeLarge))
                                .padding(.top, bottomTopPaddingSingleRight)
                                .padding(.leading, bottomLeadingPaddingSingleRight)
                                .foregroundColor(rightColor)
                        }
                        
                        else {
                            Text("\(rightCalculatedWeight) + \(rightLeftoverWeight)#")
                                .bold()
                                .font(.system(size: fontSizeSmall))
                                .padding(.top, bottomTopPaddingDoubleRight)
                                .padding(.leading, bottomLeadingPaddingDoubleRight)
                                .foregroundColor(rightColor)
                        }

                    }
                    
                }
            )
        
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
                                    .font(.system(size: fontSizeLarge))
                                    .padding(.bottom, topTopPadding)
                                    .padding(.trailing, topTrailingPadding)
                                    .foregroundColor(leftColor)
                                    ._tightPadding()
                                    .onChange(of: leftRequestedWeightInput) {newValue in
                                        print(newValue)
                                        fishHouseRequests.updateData(requestToUpdateID: leftName, updatedAmount: newValue)
                                    }
                        
                                TextField("\(rightRequestedWeight)", value: $rightRequestedWeightInput, format: .number)
                                    .keyboardType(.numberPad)
                                    .font(.system(size: fontSizeLarge))
                                    .padding(.top, topTopPadding)
                                    .padding(.leading, topTrailingPadding)
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
    }
    
    //MARK: - Control Panel
    let viewHeightMultiplier: Double =  0.5
    let viewWidthMultiplier: Double = 0.6
    
    //0.115
    //0.095
    
    let viewWidthRatio: CGFloat = 0.70
    let viewHeightRatio: CGFloat = 0.50
    
    let fontSizeLarge: CGFloat = 50.0
    let fontSizeSmall: CGFloat = 40.0
    
    let fontSizeSmaller: CGFloat = 35.0
    
    let topTopPadding: CGFloat = 30.0
    
    let topTrailingPadding: CGFloat = 150.0
    let topLeadingPadding: CGFloat = 30.0
    
    let bottomTrailingPaddingSingle: CGFloat = 30.0
    let bottomTrailingPaddingDouble: CGFloat = 35.0
    
    let bottomTopPaddingDoubleRight: CGFloat = 100.0
    let bottomLeadingPaddingDoubleRight: CGFloat = 200.0
    
    let bottomTopPaddingSingleLeft: CGFloat = 75.0
    let bottomTrailingPaddingSingleLeft: CGFloat = 300.0
    
    let bottomTopPaddingDoubleLeft: CGFloat = 75.0
    let bottomTrailingPaddingDoubleLeft: CGFloat = 300.0
    
    let bottomTopPaddingSingleRight: CGFloat = 100.0
    let bottomLeadingPaddingSingleRight: CGFloat = 200.0
    
    
    //Math stuff
    
    let fullBucket: Int = 25
}

struct EditableTriangleBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader {geometry in
        
            EditableTriangleBoxView(fishHouseRequests: FishHouseRequests(), geometryHeight: geometry.size.height, geometryWidth: geometry.size.width, leftColor: .blue, rightColor: .green, leftName: "show_little", leftRequestedWeight: 299, leftRequestedWeightInput: 299, rightName: "show_big", rightRequestedWeight: 200, rightRequestedWeightInput: 200)
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
