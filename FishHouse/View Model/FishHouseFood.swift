//
//  FishHouseFood.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 5/19/22.
//

import Foundation
import Firebase

class FishHouseFood: ObservableObject {
    
    @Published var foods = [Food]()
    
    init() {
        getData()
    }
    
    // Grabs data from firestore database
    func getData() {
            
            // Get a reference to the database
            let db = Firestore.firestore()
            
            // Read the documents at a specific path
            db.collection("foods").getDocuments { snapshot, error in
                
                // Check for errors
                if error == nil {
                    // No errors
                    
                    if let snapshot = snapshot {
                        
                        // Update the list property in the main thread
                        DispatchQueue.main.async {
                            
                            // Get all the documents and create Requests
                            self.foods = snapshot.documents.map { d in
                                
                                // Create a Food item for each document returned
                                return Food(id: d.documentID,
                                            name: d["name"] as? String ?? "",
                                            abbrev: d["abbrev"] as? String ?? "",
                                            box_weight: d["box_weight"] as? Int ?? 50,
                                            add_on: d["add_on"] as? Bool ?? false,
                                            show: d["requests/show/amount"] as? Int ?? 50,
                                            point: d["requests/point/amount"] as? Int ?? 50,
                                            pinn: d["requests/pinn/amount"] as? Int ?? 50,
                                            otter: d["requests/otter/amount"] as? Int ?? 50,
                                            whale: d["requests/whale/amount"] as? Int ?? 50,
                                            aquariums: d["requests/aquariums/amount"] as? Int ?? 50,
                                            rescue: d["requests/rescue/amount"] as? Int ?? 50,
                                            wild: d["requests/wild/amount"] as? Int ?? 50
                                        
                                )
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
    
    //Find the food queried in the string
    func findFood(name: String, location: ParkLocation) -> Int {
            
        for food in foods
        {
            //Food has been found
            if food.name == name
            {
                //Find which location, return amount attached to location
                switch location
                {
                case .show:
                    return food.show
                case .point:
                    return food.point
                case .pinn:
                    return food.pinn
                case .otter:
                    return food.otter
                case .whale:
                    return food.whale
                case .aquariums:
                    return food.aquariums
                case .rescue:
                    return food.rescue
                case .wild:
                    return food.wild
                    
                default:
                    print("findFood could not find location")
                    return 0
                    
                }
            }
            
            print("Could not find fish")
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
