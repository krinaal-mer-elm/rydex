//
//  MapViewModel.swift
//  rydex
//
//  Created by elluminati on 03/07/24.
//

import Foundation

class MapViewModel: ObservableObject {
    @Published var vehicleTypes: [VehicleType] = []

    func fetchVehicleTypes() {
        guard let jsonURL = Bundle.main.url(forResource: "type_list", withExtension: "json") else {
            print("JSON file not found.")
            return
        }

        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let welcome = try decoder.decode(Welcome.self, from: jsonData)
            vehicleTypes = welcome.data.vehicleTypes
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }
}


