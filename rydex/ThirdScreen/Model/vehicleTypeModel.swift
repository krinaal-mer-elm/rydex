import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let vehicleTypes: [VehicleType]
}

// MARK: - VehicleType
struct VehicleType: Codable , Identifiable{
    let id: String
    let type: Int
    let name: Name
    let imageURL: String
    let isDriverAvailable: Bool
    let passengerCapacity, uniqueID: Int
    let price : String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case type, name
        case imageURL = "imageUrl"
        case isDriverAvailable, passengerCapacity
        case uniqueID = "uniqueId"
        case price 
    }
}

// MARK: - Name
struct Name: Codable {
    let en: String
}
