//
//  EmptySimpleBoxView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/30/21.
//

import SwiftUI

struct EmptySimpleBoxView: View {
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
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
        .background(alignment: .topLeading, content: {
            Rectangle()
                .strokeBorder(.black, lineWidth: 2)
                .frame(width: viewWidth * 0.65, height: viewHeight * 0.50, alignment: .topLeading)
        })
        
    }
    
    let paddingRatio: CGFloat = 22
    
}

struct EmptySimpleBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader {geometry in
        
            EmptySimpleBoxView(geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                .position(x: 200.0, y: 200.0)
            
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
