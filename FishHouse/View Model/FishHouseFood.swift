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
    
    func updateData(foodID: String, location: ParkLocation, updatedAmount: Int)
    {
        let db = Firestore.firestore()
        
        let documentToUpdate = db.collection("fish").document(foodID).collection("requests")
        
       switch location
        {
       case .show:
           documentToUpdate.document("show").setData(["amount": updatedAmount], merge: true)
           {
               error in
               
               if error == nil {
                   self.getData()
               }
           
               else {
                   print("Failed to update data")
               }
               
           }
       case .point:
           documentToUpdate.document("point").setData(["amount": updatedAmount], merge: true)
           {
               error in
               
               if error == nil {
                   self.getData()
               }
           
               else {
                   print("Failed to update data")
               }
               
           }
       case .pinn:
           documentToUpdate.document("pinn").setData(["amount": updatedAmount], merge: true)
           {
               error in
               
               if error == nil {
                   self.getData()
               }
           
               else {
                   print("Failed to update data")
               }
               
           }
       case .otter:
           documentToUpdate.document("otter").setData(["amount": updatedAmount], merge: true)
           {
               error in
               
               if error == nil {
                   self.getData()
               }
           
               else {
                   print("Failed to update data")
               }
               
           }
           
       case .whale:
           documentToUpdate.document("whale").setData(["amount": updatedAmount], merge: true)
           {
               error in
               
               if error == nil {
                   self.getData()
               }
           
               else {
                   print("Failed to update data")
               }
               
           }
           
       case .aquariums:
           documentToUpdate.document("aquariums").setData(["amount": updatedAmount], merge: true)
           {
               error in
               
               if error == nil {
                   self.getData()
               }
           
               else {
                   print("Failed to update data")
               }
               
           }
           
       case .rescue:
           documentToUpdate.document("rescue").setData(["amount": updatedAmount], merge: true)
           {
               error in
               
               if error == nil {
                   self.getData()
               }
           
               else {
                   print("Failed to update data")
               }
               
           }
           
       case .wild:
           documentToUpdate.document("wild").setData(["amount": updatedAmount], merge: true)
           {
               error in
               
               if error == nil {
                   self.getData()
               }
           
               else {
                   print("Failed to update data")
               }
               
           }

           
       }
        
    }

    func totalPoundsNeededFor(food: Food) -> Int {
        //Returns total number of pounds needed
        var totalPoundsNeeded: Int = 0
        // Scan array of foods
        for food in foods {
            //Find food specified in function argument
            if food.id == food.id
            {
            //Return the totalPoundsNeeded + the requests for all of the food
                totalPoundsNeeded = totalPoundsNeeded + food.aquariums + food.rescue + food.whale + food.point + food.wild + food.otter + food.pinn + food.show
            }
        }
        
        return totalPoundsNeeded
    }
    
    func totalPoundsBrokeout(food: Food) -> Int {
        
        // Get total pounds needed, will use this reference to determine how much needs to be brokeout
        let totalPoundsNeeded: Int = totalPoundsNeededFor(food: food)
        
        //Init variable
        var totalPoundsBrokeout: Int = 0
        
        //Add boxes until over needed
        // but also check if total pounds brokeout is at least 10 pounds
        while (totalPoundsBrokeout <= totalPoundsNeeded) {
            
            //We check to see if the totalPoundsBrokeout + the boxWeight / 2 is greater than or equal to the totalPoundsNeeded, if so, end the loop
            if (totalPoundsBrokeout + food.box_weight / 2 >= totalPoundsNeeded) {
                break
            }
            //Add the box to breakout
            totalPoundsBrokeout += food.box_weight
        }
        
        //Check if we manually add on box, you never know lol
        if (food.add_on) {
            totalPoundsBrokeout += food.box_weight
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
