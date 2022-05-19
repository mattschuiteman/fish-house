//
//  DoubleBoxView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/12/21.
//

import SwiftUI

struct DoubleBoxView: View {
    
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
            BottomHalfTriangle()
                .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .frame(width: viewWidth * 0.65, height: viewHeight * 0.50, alignment: .center)
        })
        
    }
}

struct DoubleBoxView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geometry in
            DoubleBoxView(geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                .position(x: 200.0, y: 200.0)
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
