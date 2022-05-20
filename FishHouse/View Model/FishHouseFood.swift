//
//  FishHouseFood.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 5/19/22.
//

import Foundation
import Firebase

class FishHouseRequests: ObservableObject {
    
    @Published var requests = [Request]()
    
    init() {
        getData()
    }
    
    // Grabs data from firestore database
    func getData() {
            
            // Get a reference to the database
            let db = Firestore.firestore()
            
            // Read the documents at a specific path
            db.collection("requests").getDocuments { snapshot, error in
                
                // Check for errors
                if error == nil {
                    // No errors
                    
                    if let snapshot = snapshot {
                        
                        // Update the list property in the main thread
                        DispatchQueue.main.async {
                            
                            // Get all the documents and create Requests
                            self.requests = snapshot.documents.map { d in
                                
                                // Create a Request item for each document returned
                                return Request(id: d.documentID,
                                            name: d["name"] as? String ?? "",
                                            amount: d["amount"] as? Int ?? 50)
                            }
                        }
                        
                        
                    }
                    
                    else {
                        print("Something went wrong!")
                    }
                }
                else {
                    print("Something went wrong!")
                }
            }
        }
    
    func findWeight(name: String) -> Int {
            
        for request in requests {
            if request.name == name {
                return request.amount
            }
        }
        
        return 0
        
    }
    
    func findExtraWeight(fish: String) -> Int {
        for request in requests {
            if request.name.contains("extra") && request.name.contains(fish) {
                return request.amount
            }
        }
        
        return 0
    }
    
    func findExtraWeightInBoxes(boxWeight: Int) -> Int {
        for request in requests {
            if request.name.contains("extra") {
                return request.amount / boxWeight
            }
        }
        
        return 0
    }
    
    func returnMissingHerringRequest(name: String) -> String {
        
        if name.contains("pac") {
            
            if name.contains("point") {
                return "Request for pacific herring at dolphin point:"
            }
            
            else if name.contains("show") {
                return "Request for pacific herring at dolphin show: "
            }
            
            else if name.contains("pinn") {
                return "Request for pacific herring at pinniped: "
            }
            
            else if name.contains("whale") {
                return "Request for pacific herring at orca: "
            }
            
            else if name.contains("aq") {
                return "Request for pacific herring for aquariums: "
            }
            
            else if name.contains("rescue") {
                return "Request for pacific herring for rescue: "
            }
            
            else {
                return "Request for pacific herring at wild arctic: "
            }
        }
        
        else if name.contains("atl") {
            
            if name.contains("point") {
                return "Request for atlantic herring at dolphin point:"
            }
            
            else if name.contains("show") {
                return "Request for atlantic herring at dolphin show: "
            }
            
            else if name.contains("pinn") {
                return "Request for atlantic herring at pinniped: "
            }
            
            else if name.contains("whale") {
                return "Request for atlantic herring at orca: "
            }
            
            else if name.contains("aq") {
                return "Request for atlantic herring for aquariums: "
            }
            
            else if name.contains("rescue") {
                return "Request for atlantic herring for rescue: "
            }
            
            else {
                return "Request for atlantic herring at wild arctic: "
            }

        }
        
        else if name.contains("large") {
            
            if name.contains("point") {
                return "Request for large round herring at dolphin point:"
            }
            
            else if name.contains("show") {
                return "Request for large round herring at dolphin show: "
            }
            
            else if name.contains("pinn") {
                return "Request for large round herring at pinniped: "
            }
            
            else if name.contains("whale") {
                return "Request for large round herring at orca: "
            }
            
            else if name.contains("aq") {
                return "Request for large round herring for aquariums: "
            }
            
            else if name.contains("rescue") {
                return "Request for large round herring for rescue: "
            }
            
            else {
                return "Request for large round herring at wild arctic: "
            }

        }
        
        else {
            return "Could not location or fish"
        }
        
    }
    
    func updateData(requestToUpdateID: String, updatedAmount: Int)
    {
        let db = Firestore.firestore()
        
        // We search for specific document that matches our query and ONLY change the amount, not the name or ID
        db.collection("requests").document(requestToUpdateID).setData(["amount": updatedAmount], merge: true) {error in
            
            //Check for error
            //If error is nil, succesful! Get the new data
            
            if error == nil {
            
                self.getData()
                
            }
            
            else {
                print("Failed to update data")
            }
            
            
        }
    }
    
    func totalPoundsNeeded(fish: String) -> Int {
        //Returns total number of pounds needed
        
        var totalPoundsNeeded: Int = 0
        
        switch fish {
        
        //Returns total amount of PAC Herring needed
        case "pac":
            for request in requests {
                if request.name.contains("pac") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded
        
            //Returns total amount of ATL herring
        case "atl":
            for request in requests {
                if request.name.contains("atl") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded
            
        case "large":
            for request in requests {
                if request.name.contains("large") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded
        
            //Returns total amount of capelin
        case "capelin":
            for request in requests {
                if request.name.contains("capelin") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded
        
            //Returns total amount of mackerel
        case "mack":
            for request in requests {
                if request.name.contains("mack") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded
            
        case "sards":
            for request in requests {
                if request.name.contains("sards") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded
            
        case "big":
            for request in requests {
                if request.name.contains("big") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded
            
        case "little":
            for request in requests {
                if request.name.contains("little") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded
            
        case "salmon":
            for request in requests {
                if request.name.contains("salmon") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded
            
        case "shrimp":
            for request in requests {
                if request.name.contains("shrimp") {
                    totalPoundsNeeded += request.amount
                }
            }
            
            return totalPoundsNeeded

        
        default:
            print("Could not find \(fish)")
            return totalPoundsNeeded
            
        }
    }
    
    func totalPoundsBrokeout(fish: String, boxWeight: Int, addOn: Bool) -> Int {
        
        // Get total pounds needed, will use this reference to determine how much needs to be brokeout
        let totalPoundsNeeded: Int = totalPoundsNeeded(fish: fish)
        
        //Init variable
        var totalPoundsBrokeout: Int = 0
        
        //Add boxes until over needed
        // but also check if total pounds brokeout is at least 10 pounds
        while (totalPoundsBrokeout <= totalPoundsNeeded) {
            
            //We check to see if the totalPoundsBrokeout + the boxWeight / 2 is greater than or equal to the totalPoundsNeeded, if so, end the loop
            if (totalPoundsBrokeout + boxWeight / 2 >= totalPoundsNeeded) {
                break
            }
            //Add the box to breakout
            totalPoundsBrokeout += boxWeight
        }
        
        //Check if we manually add on box, you never know lol
        if (addOn) {
            totalPoundsBrokeout += boxWeight
        }
        
        return totalPoundsBrokeout
        
    }
    
    func getNumberOfBoxes(fish: String, boxWeight: Int = 1, addOn: Bool) -> Int {
        
        let totalPoundsBrokeout: Int = totalPoundsBrokeout(fish: fish, boxWeight: boxWeight, addOn: addOn)
        
        let totalNumberOfBoxes: Int = (totalPoundsBrokeout / boxWeight)
        
        return totalNumberOfBoxes
        
    }
    
    func getBoxesPerRack(fish: String, boxWeight: Int, addOn: Bool) -> [Int] {
        
        //Array that will be returned with amount of boxes on each rack
        var boxesOnRack: [Int] = []
        
        //Total number of boxes that must be allocated
        var totalNumberOfBoxes: Int = getNumberOfBoxes(fish: fish, boxWeight: boxWeight, addOn: addOn)
        
        //If there is extra weight, subtract it, it will be added on in another total
        //The following is a band-aid solution.
        
        //TODO: - Fix this band-aid solution
        if (fish == "pac") {
            totalNumberOfBoxes = totalNumberOfBoxes - findExtraWeightInBoxes(boxWeight: boxWeight)
        }
        
        let boxTotal: Double = Double(totalNumberOfBoxes)

        
        //Only one rack is needed if the total number of boxes is less than or equal to 9 OR the weight of the box is less than 30...
        //Then the maximum number of boxes is 16
        if (totalNumberOfBoxes <= 9 || (boxWeight < 30 && totalNumberOfBoxes <= 16)) {
            boxesOnRack.append(totalNumberOfBoxes)
        }
        
        //Two racks needed if the total number of boxes is between 9 and 18. Unless the box weight is less than 30, than the max box size is 32
        else if ((totalNumberOfBoxes > 9 && totalNumberOfBoxes <= 18) || (boxWeight < 30 && (totalNumberOfBoxes > 16 && totalNumberOfBoxes <= 32))) {
            let firstRackBoxes: Int = Int((boxTotal / 2).rounded(.up))
            
            let secondRackBoxes: Int = Int(boxTotal) - firstRackBoxes
            
            boxesOnRack.append(firstRackBoxes)
            boxesOnRack.append(secondRackBoxes)
            
        }
        
        // Three racks needed
        else {
            let firstRackBoxes: Int = Int((boxTotal / 3).rounded(.up))
            let secondRackBoxes: Int = firstRackBoxes
            let thirdRackBoxes: Int = Int(boxTotal) - (firstRackBoxes + secondRackBoxes)
            
            boxesOnRack.append(firstRackBoxes)
            boxesOnRack.append(secondRackBoxes)
            boxesOnRack.append(thirdRackBoxes)
        }
        
        return boxesOnRack
        
    }
    
}
