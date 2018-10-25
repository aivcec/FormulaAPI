//
//  CircuitsTests.swift
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

class CircuitsTests: XCTestCase {
    
    let bag = DisposeBag()
    
    let mockData: Data = {
        let bundle = Bundle(for: DriversTests.self)
        return try! Data(contentsOf: URL(fileURLWithPath: bundle.path(forResource: "mockResponse", ofType: "json")!))
    }()
    
    func testCanFetchAndMapFECircuits() {
        let exp = expectation(description: "Successfully received and mapped circuits.")
        
        FormulaAPI.fetchDriverCircuits(driverId: "abt", type: .fe) { response in
            switch response.result {
            case .success(_):
                exp.fulfill()
            case .failure(let err):
                XCTFail("Failed to load fe circuits, - \(err.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testCanMapCircuit() {
        stub(condition: isHost("ergast.com")) { request -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(data: self.mockData, statusCode:200, headers:nil)
        }
        
        let exp = expectation(description: "Successfully mapped circuits.")
        
        FormulaAPI.fetchDriverCircuits(driverId: "abc", type: .f1) { response in
            switch response.result {
            case .success(let circuits):
                exp.fulfill()
            case .failure(let err):
                XCTFail("Failed to map circuits, - \(err.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testCircuitsObservable() {
        let exp = expectation(description: "Successfully received circuits via observable.")
        
        FormulaAPI.driverCircuitsObs(driverId: "abc", type: .f1)
            .subscribe(onNext: { _ in
                exp.fulfill()
            }, onError: { err in
                XCTFail("Failed to fetch circuits via observable - \(err.localizedDescription)")
            }).disposed(by: bag)
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
