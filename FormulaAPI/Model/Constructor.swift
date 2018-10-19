//
//  Constructor.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 19/10/18.
//

public struct Constructor: Codable {
    public let id: String
    public let name, nationality: String
    
    enum CodingKeys: String, CodingKey {
        case id = "constructorId"
        case name, nationality
    }
}
