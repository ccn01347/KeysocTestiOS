//
//  KeysocTestTests.swift
//  KeysocTestTests
//
//  Created by Steve Lai on 5/12/2020.
//

import XCTest
@testable import KeysocTest

class KeysocTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testITunesSearch() throws{
        
        KSApiService.shared.requestITunesSearch(params: ["term":"jack+johnson","entity":"album"]) { (albums) in
            XCTAssertEqual(albums.count, 50)
            XCTAssertNotNil(albums[0].collectionId)
        } failed: { (error) in
            XCTAssertNil(error)
        }

    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
