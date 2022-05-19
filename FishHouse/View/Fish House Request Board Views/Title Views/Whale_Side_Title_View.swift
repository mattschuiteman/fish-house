//
//  Whale_Side_Title_View.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 2/12/22.
//

import SwiftUI

struct Whale_Side_Title_View: View {
    
    @ObservedObject var requests: FishHouseRequests
    
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
            
        ForEach(requests.requests) {request in
        
            if (request.name.contains( "whale_large") && request.amount != 0) {
                
                Rectangle()
                    .strokeBorder(.black, lineWidth: 2)
                    .frame(width: viewWidth, height: viewHeight, alignment: .center)
                    .overlay(
                        
                        VStack {
                            Text("\(title)")
                                .bold()
                                .frame(width: viewWidth, height: viewHeight / 2, alignment: .center)
                            
                            Text("\(request.amount)")
                                .foregroundColor(Color.large)
                                .frame(width: viewWidth, height: viewHeight / 2, alignment: .center)
                        }
                    )
                
            }
            
        }
            
    }
}

struct Whale_Side_Title_View_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geo in
            Whale_Side_Title_View(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width, title: "Shamu")
            
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
