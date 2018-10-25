//
//  DriversTests.swift
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

class DriversTests: XCTestCase {
    
    let bag = DisposeBag()
    
    let mockData: Data = {
        let bundle = Bundle(for: DriversTests.self)
        return try! Data(contentsOf: URL(fileURLWithPath: bundle.path(forResource: "mockResponse", ofType: "json")!))
    }()
    
    func testCanFetchAndMapF1Drivers() {
        let exp = expectation(description: "Successfully received and mapped f1 drivers.")
        
        FormulaAPI.fetchDrivers(type: .f1) { response in
            switch response.result {
            case .success(_):
                exp.fulfill()
            case .failure(let err):
                XCTFail("Failed to load f1 drivers, - \(err.localizedDescription)")
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testCanFetchAndMapFEDrivers() {
        let exp = expectation(description: "Successfully received and mapped fe drivers.")
        
        FormulaAPI.fetchDrivers(type: .fe) { response in
            switch response.result {
            case .success(_):
                exp.fulfill()
            case .failure(let err):
                XCTFail("Failed to load f1 drivers, - \(err.localizedDescription)")
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testCanChangeDriversPageSize() {
        let exp = expectation(description: "Successfully tested driver page size.")
        
        FormulaAPI.fetchDrivers(type: .fe, pageSize: 1) { response in
            switch response.result {
            case .success(let drivers):
                if drivers.count == 1 {
                    exp.fulfill()
                }
            case .failure(let err):
                XCTFail("Failed to load f1 drivers, - \(err.localizedDescription)")
            }
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testCanMapDriver() {
        stub(condition: isHost("ergast.com")) {request -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(data: self.mockData, statusCode:200, headers:nil)
        }
        
        let exp = expectation(description: "Successfully mapped driver.")
        
        FormulaAPI.fetchDrivers(type: .f1) { response in
            switch response.result {
            case .success(let drivers):
                exp.fulfill()
            case .failure(let err):
                XCTFail("Failed to map driver, - \(err.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
        
    }
    
    func testDriversObservable() {
        let exp = expectation(description: "Successfully received drivers via observable.")
        
        FormulaAPI.driversObs(type: .f1).subscribe(onNext: { _ in
            exp.fulfill()
        }, onError: { err in
            XCTFail("Failed to fetch drivers, - \(err.localizedDescription)")
        }).disposed(by: bag)
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
