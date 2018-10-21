//
//  Constructors.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 18/10/18.
//

import Alamofire
import CodableAlamofire
import RxAlamofire
import RxSwift

public typealias ConstructorsCompletionBlock = (DataResponse<[Constructor]>) -> ()

extension FormulaAPI {
    
    public static func driverConstructorsObs(driverId: String, type: FormulaType, year: Int? = nil) -> Observable<[Constructor]> {
        let circuitsPath = buildAPIprefix(type: type, year: year) + "drivers/\(driverId)/constructors.json"
        
        return RxAlamofire.requestData(.get, circuitsPath).map { resultPair in
            if let constructors = try? JSONDecoder().decode([Constructor].self, from: resultPair.1, keyPath: KeyPaths.constructorsKeyPath) {
                return constructors
            }
            
            return []
        }
    }
    
    public static func fetchDriverConstructors(driverId: String, type: FormulaType, year: Int? = nil, completion: @escaping ConstructorsCompletionBlock) {
        
        let path = buildAPIprefix(type: type, year: year) + "drivers/\(driverId)/constructors.json"
                
        Alamofire.request(path).responseDecodableObject(keyPath: KeyPaths.constructorsKeyPath, decoder: JSONDecoder(), completionHandler: { (response: DataResponse<[Constructor]>) in
            completion(response)
        })
    }
}
