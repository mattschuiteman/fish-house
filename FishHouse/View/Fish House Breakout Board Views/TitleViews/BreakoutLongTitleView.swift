//
//  BreakoutLongTitleView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/3/22.
//

import SwiftUI

struct BreakoutLongTitleView: View {
    
    let topText: String
    let middleText: String
    let bottomText: String
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight * 0.4
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.06
    }
    
    var textWidth: CGFloat {
        viewWidth * 0.3
    }

    var textHeight: CGFloat {
        viewHeight * 1.5
    }
    
    var middleTextHeight: CGFloat {
        viewHeight * 0.05
    }
    
    var middleTextWidth: CGFloat {
        viewWidth * 0.9
    }
    
    var body: some View {
        Rectangle()
            .stroke(lineWidth: 2)
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
            .overlay(
                VStack {
                    Text("\(topText)")
                    Text("\(middleText)")
                        .frame(width: middleTextWidth, height: middleTextHeight, alignment: .center)
                    Text("\(bottomText)")
                }
                    .frame(width: textWidth, height: textHeight, alignment: .center)
            )
    }
}

struct BreakoutLongTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BreakoutLongTitleView(topText: "#", middleText: "of", bottomText: "BOXES", geometryHeight: geo.size.height, geometryWidth: geo.size.width)
                .padding(.top)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
