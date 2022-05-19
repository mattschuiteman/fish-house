//
//  SideTitleView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/12/21.
//

import SwiftUI

struct SideTitleView: View {
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat

    let title: String
    
    var viewHeight: CGFloat {
        geometryHeight * 0.115
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
                    .frame(width: viewWidth, height: viewHeight / 2, alignment: .center)
            )
    }
}

struct SideTitleView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geo in
            SideTitleView(geometryHeight: geo.size.height, geometryWidth: geo.size.width, title: "Aquariums")
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
