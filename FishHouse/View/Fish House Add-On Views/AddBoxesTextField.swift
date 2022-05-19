//
//  AddBoxesTextField.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/15/22.
//

import SwiftUI

struct ExtraWeightTextField: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    var extraWeight: Int
    
    @State var extraWeightInput: Int
    
    var body: some View {
        TextField("\(extraWeight)#", value: $extraWeightInput, format: .number)
            .keyboardType(.numberPad)
            .onChange(of: extraWeightInput) {newValue in
                requests.updateData(requestToUpdateID: "whale_pac_extra", updatedAmount: newValue)
            }
    }
}

struct ExtraWeightTextField_Previews: PreviewProvider {
    static var previews: some View {
        ExtraWeightTextField(requests: FishHouseRequests(), extraWeight: 44, extraWeightInput: 44)
    }
}
