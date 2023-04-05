//
//  BikeViewModel.swift
//  SU_RideUp
//
//  Created by admin on 3/25/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class BikeViewModel: ObservableObject {
    @Published var bike: [Bike] = []
    
    init() {
        fetchBike()
    }
    
    func firstBike() -> Bike?  {
        bike.first
    }
    
    func fetchBike() {
        bike.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Bike")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    
                    let bike = Bike(id: id, title: title, description: description, location: location)
                    self.bike.append(bike)
                }
            }
        }
    }
}
