//
//  HomeScreenVM.swift
//  rydex
//
//  Created by elluminati on 03/07/24.
//

import SwiftUI

class HomeScreenVM: ObservableObject {
    @Published var dataArray2: [offerModel] = []

    func fetchVehicleTypes() {
         dataArray2 = [
            offerModel(name: "Ride/Schedule", imageName: "Ride", isDisabled: false),
            offerModel(name: "Rental", imageName: "Rental", isDisabled: false),
            offerModel(name: "Ride Sharing", imageName: "RideSharing", isDisabled: false)
        ]
    }
}
