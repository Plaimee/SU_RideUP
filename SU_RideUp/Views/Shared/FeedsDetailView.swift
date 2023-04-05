//
//  FeedsDetailView.swift
//  SU_RideUp
//
//  Created by admin on 3/25/23.
//

import SwiftUI
import Kingfisher

struct FeedsDetailView: View {
    
    var bike: Bike
    
    var body: some View {
        HStack {
            Image("Bike1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 144)
                .padding(.trailing)
            
            VStack(alignment: .leading) {
                
                Text(bike.title)
                    .font(.custom("Dosis-ExtraBold", size: 24))
                    .padding(.top)
                
                HStack{
                    ForEach(0..<5) { item in
                        Label("", systemImage: "star.fill")
                            .foregroundColor(.yellow)
                            .padding(.trailing, -15)
                    }
                }
                .padding(.vertical, 4)
                
                HStack {
                    Image(systemName: "mappin")
                        .foregroundColor(.white)
                    
                    Text(bike.location)
                        .font(.custom("Dosis-Regular", size: 16))
                    
                    Spacer()
                    
                    Image(systemName: "heart.circle.fill")
                        .padding(.trailing)
                        .foregroundColor(.white)
                }
                .padding(.bottom)
            }
        }
        .frame(width: 336, height: 144)
        .background(Color(red: 0, green: 0.478, blue: 0.435))    
        .foregroundColor(.white)
        .cornerRadius(10.0)
        
        
//        Spacer()
    }
}

struct FeedsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FeedsDetailView(bike: Bike(id: "1", title: "1", description: "1", location: "1"))
    }
}
