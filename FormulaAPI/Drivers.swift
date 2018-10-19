//
//  Drivers.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 18/10/18.
//

import Alamofire
import CodableAlamofire

public typealias DriversCompletionBlock = (DataResponse<[Driver]>) -> ()

extension FormulaAPI {
    
    public static func fetchDrivers(type: FormulaType, year: Int? = nil, pageSize: Int = 10, offset: Int = 0, completion: @escaping DriversCompletionBlock) {
        
        let parameters: Parameters = [
            "limit" : pageSize,
            "offset" : offset
        ]
        
        let path = buildAPIprefix(type: type, year: year) + "drivers.json"
        
        Alamofire.request(path, parameters: parameters)
            .responseDecodableObject(keyPath: "MRData.DriverTable.Drivers", decoder: JSONDecoder(), completionHandler: completion)
        
    }
}



