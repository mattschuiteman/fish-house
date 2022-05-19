//
//  SimpleBoxView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/10/21.
//

import SwiftUI

struct SimpleBoxView: View {
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let color: Color
    
    let requestedWeight: Int
    
    var viewHeight: CGFloat {
        geometryHeight * 0.115
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.095
    }
    
    var calculatedWeight: Int {
        requestedWeight / fullBucket
    }
    
    var leftoverWeight: Int {
        
        requestedWeight % fullBucket
    }
    
    
    var body: some View {
        
        
    Rectangle()
        .strokeBorder(.black, lineWidth: 2)
        .frame(width: viewWidth, height: viewHeight, alignment: .center)
        .overlay(
            ZStack {
                if (calculatedWeight != 0 && leftoverWeight == 0) {
                    Text("\(calculatedWeight)")
                        .padding(.top, paddingRatio)
                        .foregroundColor(color)
                }
                
                else if (calculatedWeight == 0 && leftoverWeight != 0){
                    Text("\(leftoverWeight)#")
                        .padding(.top, paddingRatio)
                        .foregroundColor(color)
                }
                
                else if (calculatedWeight == 0 && leftoverWeight == 0){
                    Text("")
                        .padding(.top, paddingRatio)
                        .foregroundColor(color)
                }
                            
                else {
                    Text("\(calculatedWeight) + \(leftoverWeight)#")
                        .padding(.top, paddingRatio)
                        .foregroundColor(color)
                }

            }
        )
        .background(alignment: .topLeading, content: {
            Rectangle()
                .strokeBorder(.black, lineWidth: 2)
                .frame(width: viewWidth * 0.65, height: viewHeight * 0.50, alignment: .topLeading)
                .overlay(
                    Text("\(requestedWeight)")
                        .foregroundColor(color)
                )
        })
        
    }
    
    let fullBucket: Int = 25
    let paddingRatio: CGFloat = 22
    
}

struct SimpleBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader {geometry in
        
            SimpleBoxView(geometryHeight: geometry.size.height, geometryWidth: geometry.size.width, color: Color.red, requestedWeight: 200)
                .position(x: 200.0, y: 200.0)
            
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
