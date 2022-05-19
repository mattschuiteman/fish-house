//
//  TotalLBS.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/12/22.
//

import SwiftUI

struct TotalLBS: View {
    
    var poundsNeeded: Int
    
    let color: Color
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight * 0.2
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.15
    }
    
    var body: some View {
        
        Rectangle()
            .stroke(lineWidth: 2)
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
            .overlay(
                Text("\(poundsNeeded)")
                    .font(.system(size: 35))
                    .foregroundColor(color)            )
    }
}

struct TotalLBS_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            TotalLBS(poundsNeeded: 100, color: Color.blue, geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
