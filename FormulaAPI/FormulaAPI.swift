//
//  FormulaAPI.swift
//  Alamofire
//
//  Created by Antonio Ivcec on 18/10/18.
//

public enum FormulaType {
    case f1, fe
    
    var parameter: String {
        get {
            return self == .f1 ? "f1" : "fe"
        }
    }
}

public class FormulaAPI {
    
    static let basePath: String = "https://ergast.com/api/"
    
    static func buildAPIprefix(type: FormulaType, year: Int?) -> String {
        let yearPath: String
        if let year = year {
            yearPath = "\(year)/"
        } else {
            yearPath = ""
        }
        
        return "\(FormulaAPI.basePath)\(type.parameter)/\(yearPath)"
    }
}
