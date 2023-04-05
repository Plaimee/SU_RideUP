//
//  MainTabView.swift
//  SU_RideUp
//
//  Created by admin on 3/24/23.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject private var auth: AuthViewModel
    @State private var isShowLogin: Bool = false
    
    var body: some View {
        Group {
            if auth.isUserAuthenticated {
                TabView {
                    FeedsView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                    
                    HistoryView()
                        .tabItem {
                            Label("History", systemImage: "clock.arrow.circlepath")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Label("User", systemImage: "person.fill")
                        }
                }
                .accentColor(Color(red: 0, green: 0.478, blue: 0.435))
            }
        }
        .fullScreenCover(isPresented: $isShowLogin) {
            StartView()
        }
        .onReceive(auth.$isUserAuthenticated) { _ in
            isShowLogin = !auth.isUserAuthenticated
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(AuthViewModel())
    }
}
