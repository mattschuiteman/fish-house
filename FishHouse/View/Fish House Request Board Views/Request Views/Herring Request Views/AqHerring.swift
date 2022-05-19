//
//  AqHerring.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 12/31/21.
//

import SwiftUI

import SwiftUI

struct AqHerring: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    let isEditable: Bool
    
    let pac: String = "aq_pac"
    let atl: String = "aq_atl"
    let large: String = "aq_large"
    
    let atlAbbrev: String = "ATH"
    let largeAbbrev: String = "LH"
    
    var body: some View {

        ZStack
        {
            
            // If the herring box you want is editable
            
            if isEditable {
                
                //If pac requests, atl requests, and large requests are all above zero, only show pac and atl
                //If pac requests, atl requests are above zero, display below
                //We will find a way to deal with all three later
                
                if ( (requests.findWeight(name: pac) > 0) && (requests.findWeight(name: atl) > 0) && requests.findWeight(name: large) > 0 || (requests.findWeight(name: pac) > 0) && (requests.findWeight(name: atl) > 0)) {
                
                    EditableLongColumnBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, leftName: pac, rightName: atl, leftRequestedWeightInput: requests.findWeight(name: pac), rightRequestedWeightInput: requests.findWeight(name: atl), leftRequestedWeight: requests.findWeight(name: pac), rightRequestedWeight: requests.findWeight(name: atl), leftColor: Color.purple, rightColor: Color.burgundy, rightTitle: atlAbbrev)
                    
                }
                
                //If pac requests and large requests are above zero
                // display the ESBW with pac and large respectively
                
                else if ( (requests.findWeight(name: pac) > 0) &&  requests.findWeight(name: large) > 0) {
                    EditableLongColumnBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, leftName: pac, rightName: large, leftRequestedWeightInput: requests.findWeight(name: pac), rightRequestedWeightInput: requests.findWeight(name: large), leftRequestedWeight: requests.findWeight(name: pac), rightRequestedWeight: requests.findWeight(name: large), leftColor: Color.purple, rightColor: Color.large, rightTitle: largeAbbrev)
                }
                
                // If atlantic and large herring only
                
                else if ( (requests.findWeight(name: atl) > 0) &&  requests.findWeight(name: large) > 0) {
                    EditableLongColumnBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, leftName: atl, rightName: large, leftRequestedWeightInput: requests.findWeight(name: atl), rightRequestedWeightInput: requests.findWeight(name: large), leftRequestedWeight: requests.findWeight(name: atl), rightRequestedWeight: requests.findWeight(name: large), leftColor: Color.burgundy, rightColor: Color.large, rightTitle: largeAbbrev)
                }
                
                //Just pac request found
                
                else if (requests.findWeight(name: pac) > 0) {
                    
                    EditableSimpleBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, name: pac, color: Color.purple, requestedWeight: requests.findWeight(name: pac), requestedWeightInput: requests.findWeight(name: pac))
                }
                
                //Just large request found
                
                else if (requests.findWeight(name: large) > 0) {
                    EditableSimpleBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, name: large, color: Color.large, requestedWeight: requests.findWeight(name: large), requestedWeightInput: requests.findWeight(name: large))
                }
                
                //Just altantic
                
                else if (requests.findWeight(name: atl) > 0) {
                    
                    EditableSimpleBoxView(fishHouseRequests: requests, geometryHeight: geometryHeight, geometryWidth: geometryWidth, name: atl, color: Color.burgundy, requestedWeight: requests.findWeight(name: atl), requestedWeightInput: requests.findWeight(name: atl))
                    
                }
                
                else {
                    EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
                }
            }
            
            // Non editable showing
            
            else {
                
                if ( (requests.findWeight(name: pac) > 0) && (requests.findWeight(name: atl) > 0) && requests.findWeight(name: large) > 0 || (requests.findWeight(name: pac) > 0) && (requests.findWeight(name: atl) > 0)) {
                
                    LongColumnBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, leftRequestedWeight: requests.findWeight(name: pac), rightRequestedWeight: requests.findWeight(name: atl), leftColor: Color.purple, rightColor: Color.burgundy, rightTitle: atlAbbrev)
                    
                }
                
                else if ( (requests.findWeight(name: pac) > 0) &&  requests.findWeight(name: large) > 0) {
                    LongColumnBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, leftRequestedWeight: requests.findWeight(name: pac), rightRequestedWeight: requests.findWeight(name: large), leftColor: Color.purple, rightColor: Color.large, rightTitle: largeAbbrev)
                }
                
                else if ( (requests.findWeight(name: atl) > 0) &&  requests.findWeight(name: large) > 0) {
                    LongColumnBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, leftRequestedWeight: requests.findWeight(name: atl), rightRequestedWeight: requests.findWeight(name: large), leftColor: Color.burgundy, rightColor: Color.large, rightTitle: largeAbbrev)
                }

                
                else if (requests.findWeight(name: pac) > 0) {
                    
                    SimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, color: Color.purple, requestedWeight: requests.findWeight(name: pac))
                }
                
                else if (requests.findWeight(name: large) > 0) {
                    SimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, color: Color.large, requestedWeight: requests.findWeight(name: large))
                }
                
                else if (requests.findWeight(name: atl) > 0){
                    
                    SimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth, color: Color.burgundy, requestedWeight: requests.findWeight(name: atl))
                }
                
                else {
                    
                    EmptySimpleBoxView(geometryHeight: geometryHeight, geometryWidth: geometryWidth)
                    
                }
                
            }
            
        }
    }
}
