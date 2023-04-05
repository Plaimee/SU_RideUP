//
//  DateView.swift
//  SU_RideUp
//
//  Created by admin on 4/1/23.
//

import SwiftUI
import Foundation
import ExytePopupView

struct DateView: View {
    @State private var date = Date()
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    var pricePerDay: Int = 100
    @State var showingPopup = false

    var priceDays: String {
        String(difference(Date(), and: endDate))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    DatePicker("", selection: $date, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(.graphical)
                    
                    DatePicker("Start Rent", selection: $startDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                        .font(.custom("Dosis-ExtraBold", size: 30))
                        .padding()
                    
                    DatePicker("End Rent", selection: $endDate, in: startDate..., displayedComponents: [.date, .hourAndMinute])
                        .font(.custom("Dosis-ExtraBold", size: 30))
                        .padding()
                    
                    HStack{
                        
                        Text("Total")
                        
                        Spacer()
                        
                        Text("\(priceDays) บาท")
                    }
                    .font(.custom("Dosis-ExtraBold", size: 32))
                    .padding()
                    
                    
                    NavigationLink(destination: HistoryView(), label: {
                        Text("Confirm")
                            .font(.custom("Dosis-SemiBold", size: 25))
                            .popup(isPresented: $showingPopup) {
                                SuccessView()
                            } customize: {
                                $0.autohideIn(2)
                            }
                    })
                    
                    .foregroundColor(.white)
                    .frame(width: 236, height: 54)
                    .background(Color(red: 0, green: 0, blue: 0))
                    .clipShape(Capsule())
                    .padding()
                    
    //                SuccessView()
    //                    .popup(isPresented: $showingPopup) {
    //                        Text("The popup")
    //                            .frame(width: 200, height: 60)
    //                            .background(Color(red: 0.85, green: 0.8, blue: 0.95))
    //                            .cornerRadius(30.0)
    //                    } customize: {
    //                        $0.autohideIn(2)
    //                    }
                    
                    Color(red: 0.922, green: 0.886, blue: 0.82)

                }
            }
            .navigationTitle("Rent Bicycle")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(red: 0.922, green: 0.886, blue: 0.82))
        }
    }
    
    func difference(_ from: Date, and to: Date) -> Int {
        let numberOfDays = Calendar.current.dateComponents([.day], from: startDate, to: endDate)

        return numberOfDays.day! * pricePerDay
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
