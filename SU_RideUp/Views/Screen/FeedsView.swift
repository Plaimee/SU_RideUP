//
//  FeedsView.swift
//  SU_RideUp
//
//  Created by admin on 3/24/23.
//

import SwiftUI

struct FeedsView: View {
    @ObservedObject private var bikeViewModel = BikeViewModel()
    @EnvironmentObject private var auth: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(bikeViewModel.bike, id: \.id) { item in
                    NavigationLink(destination: BikeDetailView(bike: item)) {
                        FeedsDetailView(bike: item)
                    }
                }
            }
            .navigationTitle("Choose Your Bicycle")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            FeedsView()
        }
    }
}
