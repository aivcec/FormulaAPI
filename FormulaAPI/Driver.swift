//
//  Driver.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 18/10/18.
//

struct DriversData: Codable {
    let mrData: MRData
    
    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct MRData: Codable {
    let driverTable: DriverTable
    
    enum CodingKeys: String, CodingKey {
        case driverTable = "DriverTable"
    }
}

struct DriverTable: Codable {
    let drivers: [Driver]
    
    enum CodingKeys: String, CodingKey {
        case drivers = "Drivers"
    }
}

public struct Driver: Codable {
    public var id: String!
    public var givenName: String!
    public var familyName: String!
    public var dateOfBirth: String!
    public var nationality: String!
    
    enum CodingKeys: String, CodingKey {
        case id = "driverId"
        case givenName, familyName, dateOfBirth, nationality
    }
}
