//
//  Driver.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 18/10/18.
//

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
