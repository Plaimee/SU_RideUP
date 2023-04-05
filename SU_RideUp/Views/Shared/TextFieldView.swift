//
//  TextFieldView.swift
//  SU_RideUp
//
//  Created by admin on 3/24/23.
//

import SwiftUI

struct GrayRoundedTextFieldBackground: TextFieldStyle {
    
    let systemImageString: String
        
        // Hidden function to conform to this protocol
        func _body(configuration: TextField<Self._Label>) -> some View {
            ZStack {
                Rectangle()
                    .frame(height: 54)
                    .cornerRadius(50)
                
                HStack {
                    Image(systemName: systemImageString)
                    // Reference the TextField here
                    configuration
                }
                .padding(.leading)
                .foregroundColor(.gray)
            }
        }
}

//struct TextFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldView()
//    }
//}
