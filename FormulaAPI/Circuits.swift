//
//  Circuits.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 18/10/18.
//

import Alamofire
import CodableAlamofire

extension FormulaAPI {
    
    public static func fetchDriverCircuits(driverId: String, type: FormulaType, year: Int? = nil) {
        
        let path = buildCircuitsPath(driverId: driverId, type: type, year: year)
        print(path)
        Alamofire.request(path).responseJSON{ response in
            print(response)
        }
    }
    
    private static func buildCircuitsPath(driverId: String, type: FormulaType, year: Int?) -> String {
        let yearPath: String
        if let year = year {
            yearPath = "\(year)/"
        } else {
            yearPath = ""
        }
        
        return "\(FormulaAPI.basePath)\(type.parameter)/\(yearPath)drivers/\(driverId)/circuits.json"
    }
}
