//
//  HerringPoundsNeeded.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/5/22.
//

import SwiftUI

struct DoubleTotalLBS: View {
    
    var leftPoundsNeeded: Int
    var rightPoundsNeeded: Int
    
    let leftColor: Color
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
        
        ZStack {
            
            if (enoughDifferenceToHalve(lhs: leftPoundsNeeded, rhs: rightPoundsNeeded)) {
                
                RectangleHalvedWithTriangle()
                    .stroke(lineWidth: 2)
                    .frame(width: viewWidth, height: viewHeight, alignment: .center)
                    .overlay(
                        Text("\(rightPoundsNeeded)")
                            .font(.system(size: 30))
                            .foregroundColor(rightColor)
                            .padding(.top, 35)
                            .padding(.leading, 50)
                    )
                    .overlay(
                        Text("\(leftPoundsNeeded)")
                            .font(.system(size: 30))
                            .foregroundColor(leftColor)
                            .padding(.bottom, 35)
                            .padding(.trailing, 60)
                    )
                
            }
            
            else {
        
                RectangleCorner()
                    .stroke(lineWidth: 2)
                    .frame(width: viewWidth, height: viewHeight, alignment: .center)
                    .overlay(
                        Text("\(rightPoundsNeeded)")
                            .foregroundColor(rightColor)
                            .padding(.top, 55)
                            .padding(.leading, 90)
                    )
                    .overlay(
                        Text("\(leftPoundsNeeded)")
                            .font(.system(size: 35))
                            .foregroundColor(leftColor)
                            .padding(.bottom, 20)
                    )
                
            }
            
        }
    }
    
    func enoughDifferenceToHalve(lhs: Int, rhs: Int) -> Bool {
        
        let tippingPoint: Int = 400
        
        if lhs > rhs {
            
            if lhs - rhs > tippingPoint {
                return false
            }
            
            return true
        }
        
        else {
            
            if rhs - lhs > tippingPoint {
                return false
            }
            
            return true
            
        }
    }
}

struct DoubleTotalLBS_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geo in
            DoubleTotalLBS(leftPoundsNeeded: 1036, rightPoundsNeeded: 315, leftColor: Color.red, rightColor: Color.purple, geometryHeight: geo.size.height, geometryWidth: geo.size.width)
                .position(x: 200, y: 200)
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
