//
//  TopTitleView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/12/21.
//

import SwiftUI

struct TopTitleView: View {
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat

    let title: String
    
    var viewHeight: CGFloat {
        geometryHeight * 0.0625
    }
    
    var viewWidth: CGFloat {
        geometryWidth * 0.095
    }
    
    
    var body: some View {
        
        Rectangle()
            .strokeBorder(.black, lineWidth: 2)
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
            .overlay(
                Text("\(title)")
                    .bold()
            )
    }
}

struct TopTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            TopTitleView(geometryHeight: geo.size.height, geometryWidth: geo.size.width, title: "Herring")
                .position(x: 200.0, y: 200.0)
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
