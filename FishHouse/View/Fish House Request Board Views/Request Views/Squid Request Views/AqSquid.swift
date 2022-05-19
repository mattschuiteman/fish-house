//
//  AqSquid.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/1/22.
//

import SwiftUI

import SwiftUI

struct AqSquid: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let leftName: String = "aq_little"
    let rightName: String = "aq_big"
    
    var body: some View {
        
        NavigationLink(destination:
                        EditableTriangleBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, leftColor: Color.blue, rightColor: Color.green, leftName: leftName, leftRequestedWeight: requests.findWeight(name: leftName), leftRequestedWeightInput: requests.findWeight(name: leftName), rightName: rightName, rightRequestedWeight: requests.findWeight(name: rightName), rightRequestedWeightInput: requests.findWeight(name: rightName)))
        {
            TriangleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, leftColor: Color.blue, rightColor: Color.green, leftRequestedWeight: requests.findWeight(name: leftName), rightRequestedWeight: requests.findWeight(name: rightName))
        }
    }
}

struct AqSquid_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{geo in
            AqSquid(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}

