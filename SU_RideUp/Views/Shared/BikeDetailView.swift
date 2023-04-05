//
//  BikeDetailView.swift
//  SU_RideUp
//
//  Created by admin on 3/25/23.
//

import SwiftUI

struct BikeDetailView: View {
    
    var bike: Bike
    
    var body: some View {
        ScrollView {
            imageBikeDetailView(bike: bike)
            VStack {
                HStack {
                    Text("Description")
                        .font(.custom("Dosis-Medium", size: 24))
                        .padding()
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Label("", systemImage: "square.and.pencil.circle.fill")
                            .foregroundColor(.black)
                            .frame(width: 16, height: 16)
                    }
                    
                    Button {
                        
                    } label: {
                        Label("", systemImage: "heart.circle.fill")
                            .foregroundColor(.black)
                    }
                    .padding()
                    
                }
                
                VStack {
                    Text(bike.description)
                        .font(.custom("Dosis-Medium", size: 16))
                        .padding(.horizontal)
                    
                    NavigationLink(destination: DateView(), label: {
                        Text("Confirm")
                            .font(.custom("Dosis-SemiBold", size: 25))
                    })
                    .foregroundColor(.white)
                    .frame(width: 236, height: 54)
                    .background(Color(red: 0, green: 0.478, blue: 0.435))
                    .clipShape(Capsule())
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color(red: 0.922, green: 0.886, blue: 0.82).opacity(1))
    }
}

struct BikeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BikeDetailView(bike: Bike(id: "1", title: "Bike1", description: "1", location: "1"))
    }
}
