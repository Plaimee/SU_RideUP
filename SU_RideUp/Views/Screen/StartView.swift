//
//  StartView.swift
//  SU_RideUp
//
//  Created by admin on 3/24/23.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject private var auth: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Hi! Welcome To")
                        .foregroundColor(.white)
                        .font(.custom("Dosis-SemiBold", size: 25))
                    Image("Logo")
                        .resizable()
                        .frame(width: 344, height: 208)
                        .padding()
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), label: {
                        Text("Get Started")
                            .font(.custom("Dosis-SemiBold", size: 25))
                    })
                    
                    .foregroundColor(.white)
                    .frame(width: 236, height: 54)
                    .background(Color(red: 0, green: 0.478, blue: 0.435))
                    .clipShape(Capsule())
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
