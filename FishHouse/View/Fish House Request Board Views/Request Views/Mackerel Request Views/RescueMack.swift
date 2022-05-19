//
//  RescueMack.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/1/22.
//

import SwiftUI

struct RescueMack: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let name: String = "rescue_mack"
    
    var body: some View {
        
        NavigationLink(destination: EditableSimpleBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, name: name, color: Color.red, requestedWeight: requests.findWeight(name: name), requestedWeightInput: requests.findWeight(name: name)))
        {
            SimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, color: Color.red, requestedWeight: requests.findWeight(name: name))
        }
    }
}

struct RescueMack_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{geo in
            RescueMack(requests: FishHouseRequests(), geometryHeight: geo.size.height, geometryWidth: geo.size.width)
        }
    }
}
