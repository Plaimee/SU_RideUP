//
//  LoginView.swift
//  SU_RideUp
//
//  Created by admin on 3/24/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var auth: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                Text("Log in")
                    .foregroundColor(.white)
                    .font(.custom("Dosis-SemiBold", size: 48))
                    .offset(x: -100)
                
                Spacer()
                TextField("Email", text: $email, prompt: Text("abc@su.ac.th").foregroundColor(.gray))
                    .textFieldStyle(GrayRoundedTextFieldBackground(systemImageString: "envelope"))
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .padding(.horizontal)
                
                SecureField("Password", text: $password, prompt: Text("123456").foregroundColor(.gray))
                    .textFieldStyle(GrayRoundedTextFieldBackground(systemImageString: "key"))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Button {
                    if email != "" && password != "" {
                        auth.login(email: email, password: password)
                    }
                } label: {
                    Text("Login")
                        .font(.custom("Dosis-SemiBold", size: 25))
                }
                .foregroundColor(.white)
                .frame(width: 236, height: 54)
                .background(Color(red: 0, green: 0.478, blue: 0.435))
                .clipShape(Capsule())
                .offset(y: 50)                
                
                Spacer()
                
                HStack{
                    Button {
                        auth.register(email: email,
                                      password: password,
                                      firstName: "Piyanut",
                                      lastName: "Plaimee") { result in
                            switch result {
                            case .success(let isSuccess):
                                print(isSuccess ? "Register success" : "Register failed")
                                // Go to login view.
                            case .failure(let error):
                                print(error.localizedDescription)
                                // Show Alert
                            }
                        }
                    } label: {
                        Text("Create Account")
                            .font(.custom("Dosis-SemiBold", size: 16))
                            .foregroundColor(.white)
                    }

                    
                    Rectangle()
                        .frame(width: 1, height: 50)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        
                    
                    NavigationLink(destination: LoginView(), label: {
                        Text("Forget Password?")
                            .font(.custom("Dosis-SemiBold", size: 16))
                            .foregroundColor(.white)
                    })
                }
                .padding()
            }
        }
        .onChange(of: auth.isUserAuthenticated) { newValue in
            if newValue == true {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
