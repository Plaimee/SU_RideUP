//
//  SuccessView.swift
//  SU_RideUp
//
//  Created by admin on 4/5/23.
//

import SwiftUI
import ExytePopupView

struct SuccessView : View {
    @State var showingPopup = false // 1
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0, green: 0.478, blue: 0.435))
                .frame(width: 250, height: 250)
                .cornerRadius(20)
            
            VStack{
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .padding()
                
                
                Text("Rent Success!")
                    .foregroundColor(.white)
                Text("thank you for your rent")
                    .foregroundColor(.white)
                    .font(.custom("Dosis-Medium", size: 16))
            }
            .font(.custom("Dosis-Regular", size: 24))
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
