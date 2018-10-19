//
//  Circuit.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 19/10/18.
//

public struct Circuit: Codable {
    let id: String
    let circuitName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "circuitId"
        case circuitName
    }
}
