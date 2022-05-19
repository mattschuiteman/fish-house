//
//  RescueCaplin.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/31/21.
//

import SwiftUI

import SwiftUI

struct RescueCapelin: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let name: String = "rescue_capelin"
    
    var body: some View {
        
        NavigationLink(destination: EditableSimpleBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, name: name, color: Color.capelin, requestedWeight: requests.findWeight(name: name), requestedWeightInput: requests.findWeight(name: name)))
        {
            SimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, color: Color.capelin, requestedWeight: requests.findWeight(name: name))
        }
    }
}

struct RescueCaplin_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{geo in
            RescueCapelin(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
    }
}
