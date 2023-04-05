//
//  SU_RideUpApp.swift
//  SU_RideUp
//
//  Created by admin on 3/24/23.
//

import SwiftUI
import FirebaseCore

@main
struct SU_RideUpApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(AuthViewModel())
        }
    }
}
