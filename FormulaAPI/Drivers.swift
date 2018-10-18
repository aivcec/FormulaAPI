//
//  Drivers.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 18/10/18.
//

import Alamofire
import CodableAlamofire

public enum FormulaType {
    case f1, fe
    
    var parameter: String {
        get {
            return self == .f1 ? "f1" : "fe"
        }
    }
}

public typealias DriverListTask = ([Driver]) -> ()

extension FormulaAPI {
    
    public static func fetchDrivers(type: FormulaType, year: Int? = nil, pageSize: Int = 10, offset: Int = 0, completion: @escaping DriverListTask) {
        
        let parameters: Parameters = [
            "limit" : pageSize,
            "offset" : offset
        ]
        
        let path = buildDriversUrl(type: type, year: year)
        
        Alamofire.request(path, parameters: parameters).responseDecodableObject { (response: DataResponse<DriversData>) in
   
            switch response.result {
            case .success(let data):
                completion(data.mrData.driverTable.drivers)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private static func buildDriversUrl(type: FormulaType, year: Int?) -> String {
        var path: String = "\(FormulaAPI.basePath)\(type.parameter)/"
        
        if let year = year {
            path = path + "\(year)/"
        }
        
        path = path + "drivers.json"
        
        return path
    }
}



