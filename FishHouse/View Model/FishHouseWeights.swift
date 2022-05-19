//
//  FishHouseWeights.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/11/22.
//

import Foundation
import Firebase


class FishHouseWeights: ObservableObject {
    
    @Published var weights = [Weight]()
    
    init() {
        getWeight()
    }
    
    func getWeight() {
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("weights").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Requests
                        self.weights = snapshot.documents.map { d in
                            
                            // Create a Request item for each document returned
                            return Weight(id: d.documentID,
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
    
    func updateWeight(requestToUpdateID: String, updatedAmount: Int)
    {
        let db = Firestore.firestore()
        
        // We search for specific document that matches our query and ONLY change the amount, not the name or ID
        db.collection("weights").document(requestToUpdateID).setData(["amount": updatedAmount], merge: true) {error in
            
            //Check for error
            //If error is nil, succesful! Get the new data
            
            if error == nil {
            
                self.getWeight()
                
            }
            
            else {
                print("Failed to update data")
            }
            
            
        }
    }
    
    func findWeight(name: String) -> Int {
        
        for weight in weights {
            if weight.name.contains(name) {
                return weight.amount
            }
        }
        
        return 0
    }
    
}
