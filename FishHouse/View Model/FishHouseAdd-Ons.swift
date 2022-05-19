//
//  FishHouseAdd-Ons.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/14/22.
//

import Foundation
import Firebase


class FishHouseAddOns: ObservableObject {
    
    @Published var add_ons = [Add_On]()
    
    init() {
        getAdd_Ons()
    }
    
    func getAdd_Ons() {
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("add-ons").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Requests
                        self.add_ons = snapshot.documents.map { d in
                            
                            // Create a Request item for each document returned
                            return Add_On(id: d.documentID,
                                        name: d["name"] as? String ?? "",
                                          didAddOn: d["didAddOn"] as? Bool ?? false)
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
    
    func updateAdd_On(requestToUpdateID: String, updatedTo: Bool)
    {
        let db = Firestore.firestore()
        
        // We search for specific document that matches our query and ONLY change the amount, not the name or ID
        db.collection("add-ons").document(requestToUpdateID).setData(["didAddOn": updatedTo], merge: true) {error in
            
            //Check for error
            //If error is nil, succesful! Get the new data
            
            if error == nil {
            
                self.getAdd_Ons()
                
            }
            
            else {
                print("Failed to update data")
            }
            
            
        }
    }
    
    func findAddOn(name: String) -> Bool {
        for add_on in add_ons {
            if add_on.id == name {
                return add_on.didAddOn
            }
        }
        
        return false
    }
    
}
