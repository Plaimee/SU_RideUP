//
//  HistoryView.swift
//  SU_RideUp
//
//  Created by admin on 3/24/23.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject private var bikeViewModel = BikeViewModel()
    
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    ForEach(bikeViewModel.bike, id: \.id) { item in
                        NavigationLink(destination: BikeDetailView(bike: item)) {
                            FeedsDetailView(bike: item)
                        }
                    }
                    .navigationTitle("Bicycle History")
                    .navigationBarTitleDisplayMode(.large)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
