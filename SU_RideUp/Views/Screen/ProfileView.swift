//
//  ProfileView.swift
//  SU_RideUp
//
//  Created by admin on 3/24/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var auth: AuthViewModel
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 320, height: 320)
                    .cornerRadius(30)
                
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 118, height: 118)
                        .foregroundColor(.white)
                    
                    Text("Piyanut Plaimee")
                        .font(.custom("Dosis-ExtraBold", size: 24))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                    
                    Text("Digital Technology for Design")
                        .font(.custom("Dosis-Regular", size: 16))
                        .foregroundColor(.white)
                        
                    Text("Interactive Application")
                        .font(.custom("Dosis-Regular", size: 16))
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            HStack {
                Text("จำนวนครั้งการยืม")
                    .font(.custom("Dosis-ExtraBold", size: 16))
                
                Spacer()
                
                Text("57 ครั้ง")
                    .font(.custom("Dosis-ExtraBold", size: 16))
            }
            .padding(.horizontal)
            
            List {
                NavigationLink {
                    
                } label: {
                    Label("Account information", systemImage: "person.circle.fill")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Favourite", systemImage: "heart.circle.fill")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Payment", systemImage: "creditcard")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Notifications", systemImage: "bell.fill")
                }
                
                NavigationLink {
                    
                } label: {
                    Label("Settings", systemImage: "person.circle.fill")
                }
                
                Button {
                    auth.logout()
                } label: {
                    Label("Log out", systemImage: "power")
                }

            }
            

            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
