//
//  RepositoryViewModelTests.swift
//  gitswiftTests
//
//  Created by Rodrigo Andrade on 07/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import XCTest
@testable import gitswift

class RepositoryViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    var page = 1
    
    var timeout: TimeInterval = 10.0
        
    func testFetchRepositories() {
        let exp = expectation(description: #function)
        let viewModel = RepositoryViewModel()
        
        viewModel.didCompleteFetch = {
            XCTAssert(viewModel.numberOfRows()  == 50)
            exp.fulfill()
        }
        
        viewModel.fetchRepositories(page: page)
        
        waitForExpectations(timeout: timeout, handler: nil)
    
    }
}
