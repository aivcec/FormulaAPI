//
//  Circuit.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 19/10/18.
//

public struct Circuit: Codable {
    public let id: String
    public let circuitName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "circuitId"
        case circuitName
    }
}
