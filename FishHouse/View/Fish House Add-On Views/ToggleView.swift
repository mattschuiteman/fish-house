//
//  ToggleView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/14/22.
//

import SwiftUI

struct ToggleView: View {
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    let add_on: Add_On
    
    @State var boolInput: Bool
    
    var body: some View {
        
        Toggle("\(add_on.name)", isOn: $boolInput)
            .onChange(of: boolInput) {newValue in
                print(newValue)
                add_ons.updateAdd_On(requestToUpdateID: add_on.id, updatedTo: newValue)
                
            }
    }
}
