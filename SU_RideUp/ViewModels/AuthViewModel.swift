//
//  AuthViewModel.swift
//  SU_RideUp
//
//  Created by admin on 3/24/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    @Published var isUserAuthenticated = false
    
    private let db = Firestore.firestore()
    
    init() {
        if let user = Auth.auth().currentUser {
            print("Logged in user: \(user.email ?? "")")
            isUserAuthenticated = true
        } else {
            isUserAuthenticated = false
        }
    }
    
    func login(email: String, password: String) {
//        isUserAuthenticated = true
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let authResult = authResult {
                self.isUserAuthenticated = true
                print(authResult.user.email)
            }
        }
    }
    
    func logout() {
//        isUserAuthenticated = false
        do {
            try Auth.auth().signOut()
            isUserAuthenticated = false
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
//    func register(email: String, password: String) {
//        Auth.auth().createUser(withEmail: email, password: password)
//    }
    func register(email: String, password: String, firstName: String, lastName: String, completion: @escaping (Result<Bool, Error>) -> Void ) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let authResult = authResult {
                self.db.collection("users").document(authResult.user.uid).setData([
                    "email": email,
                    "firstName": firstName,
                    "lastName": lastName
                ]) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(true))
                    }
                }
            }
        }
    }
}

