//
//  PointCaplin.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/31/21.
//

import SwiftUI

struct PointCapelin: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let name: String = "point_capelin"
    
    var body: some View {
        
        NavigationLink(destination: EditableSimpleBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, name: name, color: Color.capelin, requestedWeight: requests.findWeight(name: name), requestedWeightInput: requests.findWeight(name: name)))
        {
            SimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, color: Color.capelin, requestedWeight: requests.findWeight(name: name))
        }
    }
}

struct PointCapelin_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{geo in
            PointCapelin(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
    }
}
