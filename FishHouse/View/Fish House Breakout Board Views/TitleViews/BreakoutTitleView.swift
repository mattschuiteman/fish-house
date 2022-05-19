//
//  BreakoutTitleView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/3/22.
//

import SwiftUI

struct BreakoutTitleView: View {
    
    let topText: String
    let middleText: String
    let bottomText: String
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight * 0.2
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.06
    }
    
    var textHeight: CGFloat {
        viewHeight * 0.01
    }
    
    var textWidth: CGFloat {
        viewWidth
    }
    
    var body: some View {
        Rectangle()
            .stroke(lineWidth: 2)
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
            .overlay(
                VStack {
                    Text("\(topText)")
                    Text("\(middleText)")
                    Text("\(bottomText)")
                }
                    .font(.system(size: 10))
            )
    }
}

struct BreakoutTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BreakoutTitleView(topText: "Total", middleText: "lbs", bottomText: "Brokeout",geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
