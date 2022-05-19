//
//  EditableQuadBoxView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/16/21.
//

import SwiftUI

struct EditableQuadBoxView: View {
    
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
    
    let rightTitle: String = "ATH"
    
    var viewHeight: CGFloat {
        geometryHeight * 0.5
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.5
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
                .stroke(lineWidth: 6.0)
                .frame(width: viewWidth, height: viewHeight, alignment: .center)
                
            TextField("\(leftRequestedWeight)", value: $leftRequestedWeightInput, format: .number)
                    .font(.system(size: fontSizeLarge))
                    .padding(.bottom, verticalPadding)
                    .padding(.trailing, horizontalPadding)
                    .foregroundColor(leftColor)
                    .onChange(of: leftRequestedWeightInput) {newValue in
                        print(newValue)
                        fishHouseRequests.updateData(requestToUpdateID: leftName, updatedAmount: newValue)
                    }

            
            
            TextField("\(rightRequestedWeight)", value: $rightRequestedWeightInput, format: .number)
                    .font(.system(size: fontSizeLarge))
                    .padding(.bottom, verticalPadding)
                    .padding(.leading, horizontalPadding)
                    .foregroundColor(rightColor)
                    .onChange(of: rightRequestedWeightInput) {newValue in
                        print(newValue)
                        fishHouseRequests.updateData(requestToUpdateID: rightName, updatedAmount: newValue)
                    }

            
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
                    .font(.system(size: fontSizeSmall))
                        .bold()
                        .padding(.top, rightCalculatedVerticalPadding)
                        .padding(.leading, horizontalPadding)
                        .foregroundColor(rightColor)
            }
            
        }


        
        
    }
    
    //MARK: - Control Panel
    
    let fullBucket: Int = 25
    
    let fontSizeLarge: CGFloat = 50.0
    let fontSizeSmall: CGFloat = 25.0
    let megaFontSize: CGFloat = 75.0
    
    let verticalPadding: CGFloat = 75.0
    let rightLeftoverVerticalPadding: CGFloat = 50.0
    let rightCalculatedVerticalPadding: CGFloat = 100.0
    
    let horizontalPadding: CGFloat = 150.0
    
}

struct EditableQuadBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geo in
        
            EditableQuadBoxView(fishHouseRequests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width,leftName: "show_pac", rightName: "show_pac", leftRequestedWeightInput: 300, rightRequestedWeightInput: 145, leftRequestedWeight: 300, rightRequestedWeight: 145, leftColor: .purple, rightColor: .red)
                .position(x: 250, y: 250)
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
