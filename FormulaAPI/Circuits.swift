//
//  Circuits.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 18/10/18.
//

import Alamofire
import CodableAlamofire

public typealias CircuitsCompletionBlock = (DataResponse<[Circuit]>) -> ()

extension FormulaAPI {
    
    public static func fetchDriverCircuits(driverId: String, type: FormulaType, year: Int? = nil, completion: @escaping CircuitsCompletionBlock) {
        
        let path = buildAPIprefix(type: type, year: year) + "drivers/\(driverId)/circuits.json"
        
        Alamofire.request(path).responseDecodableObject(keyPath: "MRData.CircuitTable.Circuits", decoder: JSONDecoder(), completionHandler: { (response: DataResponse<[Circuit]>) in
            completion(response)
        })
    }
}
