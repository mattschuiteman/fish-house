//
//  QuadBox.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/14/21.
//

import SwiftUI

struct QuadBoxView: View {
    
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
            RectangleDividedIntoFourQuadrants()
                .stroke(lineWidth: 2.0)
                .frame(width: viewWidth, height: viewHeight, alignment: .center)
                
            Text("\(leftRequestedWeight)")
                    .font(.system(size: fontSizeLarge))
                    .bold()
                    .padding(.bottom, verticalPadding)
                    .padding(.trailing, horizontalPadding)
                    .foregroundColor(leftColor)
            
            Text("\(rightRequestedWeight)")
                    .font(.system(size: fontSizeLarge))
                    .bold()
                    .padding(.bottom, verticalPadding)
                    .padding(.leading, horizontalPadding)
                    .foregroundColor(rightColor)
            
            Text("\(rightTitle)")
                .font(.system(size: fontSizeSmall))
                .padding(.top, verticalPadding / 2)
                .padding(.leading, horizontalPadding)
            
            if (leftLeftoverWeight == 0 && leftCalculatedWeight != 0) {
                Text("\(leftCalculatedWeight)")
                        .font(.system(size: megaFontSize))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.trailing, horizontalPadding)
                        .foregroundColor(leftColor)
            }
            
            else if (leftLeftoverWeight != 0 && leftCalculatedWeight == 0)
            {
                Text("\(leftLeftoverWeight)#")
                        .font(.system(size: megaFontSize))
                        .bold()
                        .padding(.top, verticalPadding)
                        .padding(.trailing, horizontalPadding)
                        .foregroundColor(leftColor)
            }
            
            else if (leftLeftoverWeight == 0 && leftCalculatedWeight == 0) {
                Text("")
                        .font(.system(size: megaFontSize))
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
                        .padding(.top, rightLeftoverVerticalPadding)
                        .padding(.leading, horizontalPadding)
                        .foregroundColor(rightColor)
            }
            
            else if (rightLeftoverWeight != 0 && rightCalculatedWeight == 0)
            {
                Text("\(rightLeftoverWeight)#")
                        .font(.system(size: fontSizeLarge))
                        .bold()
                        .padding(.top, rightLeftoverVerticalPadding)
                        .padding(.leading, horizontalPadding)
                        .foregroundColor(rightColor)
            }
            
            else if rightLeftoverWeight == 0 && rightCalculatedWeight == 0 {
                Text("")
                        .font(.system(size: fontSizeLarge))
                        .bold()
                        .padding(.top, rightLeftoverVerticalPadding)
                        .padding(.leading, horizontalPadding)
                        .foregroundColor(rightColor)
            }
            
            else {
                Text("\(rightCalculatedWeight) + \(rightLeftoverWeight)#")
                    .font(.system(size: 6))
                        .bold()
                        .padding(.top, rightCalculatedVerticalPadding)
                        .padding(.leading, horizontalPadding)
                        .foregroundColor(rightColor)
            }
            
        }


        
        
    }
    
    //MARK: - Control Panel
    
    let fullBucket: Int = 25
    
    let fontSizeLarge: CGFloat = 12.0
    let fontSizeSmall: CGFloat = 7.0
    let megaFontSize: CGFloat = 16.0
    
    let verticalPadding: CGFloat = 20.0
    let rightLeftoverVerticalPadding: CGFloat = 24.0
    let rightCalculatedVerticalPadding: CGFloat = 25.0
    
    let horizontalPadding: CGFloat = 27.0
    
}

struct QuadBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geo in
        
            QuadBoxView(geometryHeight: geo.size.height, geometryWidth: geo.size.width, leftRequestedWeight: 585, rightRequestedWeight: 145, leftColor: .purple, rightColor: .red)
                .position(x: 250, y: 250)
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
