//
//  TriangleBoxView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/12/21.
//

import SwiftUI

struct TriangleBoxView: View {
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let leftColor: Color
    let rightColor: Color
    
    let leftRequestedWeight: Int
    let rightRequestedWeight: Int
    
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
            .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
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
                                .font(.system(size: fontSizeSmall))
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
                        .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                        .frame(width: viewWidth * viewWidthRatio, height: viewHeight * viewHeightRatio, alignment: .topLeading)
                        .overlay(
                    
                            ZStack {
                                Text("\(leftRequestedWeight)")
                                    .bold()
                                    .font(.system(size: fontSizeLarge))
                                    .padding(.bottom, topTopPadding)
                                    .padding(.trailing, topTrailingPadding)
                                    .foregroundColor(leftColor)
                        
                                Text("\(rightRequestedWeight)")
                                    .bold()
                                    .font(.system(size: fontSizeLarge))
                                    .padding(.top, topTopPadding)
                                    .padding(.leading, topTrailingPadding)
                                    .foregroundColor(rightColor)
                        
                            }
                        )
            
                }
        })
    }
    
    //MARK: - Control Panel
    let viewHeightMultiplier: Double =  0.115
    let viewWidthMultiplier: Double = 0.095
    
    //0.115
    //0.095
    
    let viewWidthRatio: CGFloat = 0.70
    let viewHeightRatio: CGFloat = 0.50
    
    let fontSizeLarge: CGFloat = 10.0
    let fontSizeSmall: CGFloat = 8.0
    
    let topTopPadding: CGFloat = 8.0
    
    let topTrailingPadding: CGFloat = 22.5
    let topLeadingPadding: CGFloat = 30.0
    
    let bottomTrailingPaddingSingle: CGFloat = 30.0
    let bottomTrailingPaddingDouble: CGFloat = 35.0
    
    let bottomTopPaddingDoubleRight: CGFloat = 30.0
    let bottomLeadingPaddingDoubleRight: CGFloat = 30.0
    
    let bottomTopPaddingSingleLeft: CGFloat = 15.0
    let bottomTrailingPaddingSingleLeft: CGFloat = 35.0
    
    let bottomTopPaddingDoubleLeft: CGFloat = 12.0
    let bottomTrailingPaddingDoubleLeft: CGFloat = 30.0
    
    let bottomTopPaddingSingleRight: CGFloat = 25.0
    let bottomLeadingPaddingSingleRight: CGFloat = 35.0
    
//    let viewHeightMultiplier: Double =  0.115
//    let viewWidthMultiplier: Double = 0.095
//
//    //0.115
//    //0.095
//
//    let viewWidthRatio: CGFloat = 0.70
//    let viewHeightRatio: CGFloat = 0.50
//
//    let fontSizeLarge: CGFloat = 10.0
//    let fontSizeSmall: CGFloat = 8.0
//
//    let topTopPadding: CGFloat = 8.0
//
//    let topTrailingPadding: CGFloat = 22.5
//    let topLeadingPadding: CGFloat = 30.0
//
//    let bottomTrailingPaddingSingle: CGFloat = 30.0
//    let bottomTrailingPaddingDouble: CGFloat = 35.0
//
//    let bottomTopPaddingDoubleRight: CGFloat = 30.0
//    let bottomLeadingPaddingDoubleRight: CGFloat = 30.0
//
//    let bottomTopPaddingSingleLeft: CGFloat = 15.0
//    let bottomTrailingPaddingSingleLeft: CGFloat = 35.0
//
//    let bottomTopPaddingDoubleLeft: CGFloat = 12.0
//    let bottomTrailingPaddingDoubleLeft: CGFloat = 30.0
//
//    let bottomTopPaddingSingleRight: CGFloat = 25.0
//    let bottomLeadingPaddingSingleRight: CGFloat = 35.0
    
    
    //Math stuff
    
    let fullBucket: Int = 25
}

struct TriangleBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader {geometry in
        
            TriangleBoxView(geometryHeight: geometry.size.height, geometryWidth: geometry.size.width, leftColor: .blue, rightColor: .green, leftRequestedWeight: 200, rightRequestedWeight: 100)
                .position(x: 200.0, y: 200.0)
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
