//
//  AddOnMotherView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/14/22.
//

import SwiftUI

struct AddOnMotherView: View {
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    @ObservedObject var requests: FishHouseRequests
    
    @ObservedObject var weights: FishHouseWeights
    
    var body: some View {
        
        List {
            
            Section(header: Text("Add Box to Breakout")) {
                
                ForEach(add_ons.add_ons) {add_on in
                    
                    ToggleView(add_ons: add_ons, add_on: add_on, boolInput: add_on.didAddOn)
                    
                }
            }
            
            Section(header: Text("Add Extra to Whale")) {
                
                HStack {
                    ExtraWeightTextField(requests: requests, extraWeight: requests.findExtraWeight(fish: "extra"), extraWeightInput: requests.findExtraWeight(fish: "extra"))
                    
                    Text("Boxes added: \(requests.findExtraWeightInBoxes(boxWeight: 22))")
                    
                    Text("Box weight: \(weights.findWeight(name: "pac"))")
                    
                }
            }
            
            Section(header: Text("Herring Request")) {
                
                ForEach(requests.requests) {request in
                    
                    if (request.amount == 0 && ( request.name.contains("pac") || request.name.contains("atl"))) {
                        
                        HStack {
                            Text("\(requests.returnMissingHerringRequest(name: request.name))")
                            
                            HerringRequestTextField(requests: requests, ID: request.name, request: request.amount, requestInput: request.amount)
                        }
                    }
                }
            }
            
            Section(header: Text("Whole Round Herring")) {
                
                ForEach(requests.requests) {request in
                    
                    if (request.name.contains("whole")) {
                        
                        HStack {
                            Text("\(requests.returnMissingHerringRequest(name: request.name))")
                            
                            HerringRequestTextField(requests: requests, ID: request.name, request: request.amount, requestInput: request.amount)
                        }
                        
                    }
                    
                }
                
            }
            
        }
        .navigationTitle(Text("Add-On Menu"))
    }
}


struct AddOnMotherView_Previews: PreviewProvider {
    static var previews: some View {
        AddOnMotherView(add_ons: FishHouseAddOns(), requests: FishHouseRequests(), weights: FishHouseWeights())
.previewInterfaceOrientation(.landscapeLeft)
    }
}
