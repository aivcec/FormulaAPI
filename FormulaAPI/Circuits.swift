//
//  Circuits.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 18/10/18.
//

import Alamofire
import CodableAlamofire
import RxSwift
import RxAlamofire

public typealias CircuitsCompletionBlock = (DataResponse<[Circuit]>) -> ()

extension FormulaAPI {
    
    public static func driverCircuitsObs(driverId: String) -> Observable<[Circuit]> {
        let circuitsPath = buildAPIprefix(type: .fe, year: nil) + "drivers/\(driverId)/circuits.json"

        
        return RxAlamofire.requestData(.get, circuitsPath).map { resultPair in
            if let circuits = try? JSONDecoder().decode([Circuit].self, from: resultPair.1, keyPath: KeyPaths.circuitsKeyPath) {
                return circuits
            }
            
            return []
        }
    }
    
    public static func fetchDriverCircuits(driverId: String, type: FormulaType, year: Int? = nil, completion: @escaping CircuitsCompletionBlock) {
        
        let path = buildAPIprefix(type: type, year: year) + "drivers/\(driverId)/circuits.json"
        
        Alamofire.request(path).responseDecodableObject(keyPath: KeyPaths.circuitsKeyPath, decoder: JSONDecoder(), completionHandler: { (response: DataResponse<[Circuit]>) in
            completion(response)
        })
    }
}
