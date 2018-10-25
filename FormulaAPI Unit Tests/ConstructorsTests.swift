//
//  Constructors.swift
//  FormulaAPI Unit Tests
//
//  Created by Antonio Ivcec on 21/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
import FormulaAPI
import Alamofire
import RxSwift
import OHHTTPStubs

class ConstructorsTests: XCTestCase {
    
    let bag = DisposeBag()
    
    let mockData: Data = {
        let bundle = Bundle(for: DriversTests.self)
        return try! Data(contentsOf: URL(fileURLWithPath: bundle.path(forResource: "mockResponse", ofType: "json")!))
    }()
    
    func testCanFetchAndMapFEConstructors() {
        let exp = expectation(description: "Successfully received and mapped constructors.")
        
        FormulaAPI.fetchDriverConstructors(driverId: "abt", type: .fe) { response in
            switch response.result {
            case .success(_):
                exp.fulfill()
            case .failure(let err):
                XCTFail("Failed to load fe constructors, - \(err.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testCanMapConstructor() {
        stub(condition: isHost("ergast.com")) { request -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(data: self.mockData, statusCode:200, headers:nil)
        }
        
        let exp = expectation(description: "Successfully mapped constructor.")
        
        FormulaAPI.fetchDriverConstructors(driverId: "abc", type: .f1) { response in
            switch response.result {
            case .success(let constructors):
                exp.fulfill()
            case .failure(let err):
                XCTFail("Failed to map constructor, - \(err.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testConstructorsObservable() {
        let exp = expectation(description: "Successfully received constructors via observable.")
        
        FormulaAPI.driverConstructorsObs(driverId: "abc", type: .f1)
            .subscribe(onNext: { _ in
                exp.fulfill()
            }, onError: { err in
                XCTFail("Failed to fetch constructors via observable - \(err.localizedDescription)")
            }).disposed(by: bag)
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}

