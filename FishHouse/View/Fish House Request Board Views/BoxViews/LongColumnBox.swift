//
//  LongColumnBox.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/17/21.
//

import SwiftUI

struct LongColumnBoxView: View {
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let leftRequestedWeight: Int
    let rightRequestedWeight: Int
    
    let leftColor: Color
    let rightColor: Color
    
    let rightTitle: String = "ATH"
    
    var viewHeight: CGFloat {
        geometryHeight * 0.115
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.095
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
                .stroke(lineWidth: 2.0)
                .frame(width: viewWidth, height: viewHeight, alignment: .center)
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
                                        .font(.system(size: fontSizeSmall))
                                        .padding(.bottom, topTopPadding)
                                        .padding(.trailing, 12.5)
                                        .foregroundColor(leftColor)
                            
                                    Text("\(rightRequestedWeight)")
                                        .bold()
                                        .font(.system(size: fontSizeSmall))
                                        .padding(.top, topTopPadding)
                                        .padding(.leading, 12.5)
                                        .foregroundColor(rightColor)
                            
                                }
                            )
                
                    }
                })
            
            Text("\(rightTitle)")
                .font(.system(size: fontSizeSmall))
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
    
    let viewWidthRatio: CGFloat = 0.50
    let viewHeightRatio: CGFloat = 0.50
    
    let fontSizeLarge: CGFloat = 12.0
    let fontSizeSmall: CGFloat = 8.0
    let megaFontSize: CGFloat = 16.0
    
    let verticalPadding: CGFloat = 20.0
    let horizontalPadding: CGFloat = 27.0
    
    let trinagleBoxHorizontalPadding: CGFloat = 20.0
    
    let rightTitlePadding: CGFloat = 25.0
    
    let topTopPadding: CGFloat = 12.0
    
}

struct LongColumnBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader {geo in
            LongColumnBox(geometryHeight: geo.size.height, geometryWidth: geo.size.width, leftRequestedWeight: 0, rightRequestedWeight: 20, leftColor: .purple, rightColor: .red)
                .position(x: 200, y: 200)
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
