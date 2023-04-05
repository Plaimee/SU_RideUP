//
//  SwiftUIView.swift
//  SU_RideUp
//
//  Created by admin on 4/2/23.
//

import SwiftUI

struct SwiftUIView: View {
    var bike: Bike
    
    var body: some View {
        ZStack{
            Image("Bike1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text(bike.title)
                    .font(.custom("Dosis-ExtraBold", size: 45))
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                HStack {
                    ForEach(0..<5) { item in
                        Label("", systemImage: "star.fill")
                            .foregroundColor(.yellow)
                            .padding(.trailing, -10)
                    }
                }
            }
            .offset(x: -100, y: 200)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
