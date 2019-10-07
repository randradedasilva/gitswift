//
//  RepositoryTableViewCellSpecs.swift
//  gitswiftTests
//
//  Created by Rodrigo Andrade on 07/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import Quick
import Nimble
@testable import gitswift

class RepositoryTableViewCellSpecs: QuickSpec {
    override func spec() {
        describe("a Repository Table Cell ") {
            var cell: RepositoryTableViewCell!
            var sut: Repository!
            
            beforeEach {
                if let path = Bundle(for: type(of: self)
                ).path(forResource: "repositories", ofType: "json") {
                    do {
                        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let response = try decoder.decode(RepositoriesResponse.self, from: data)
                        sut = response.items?.first
                        
                    } catch {
                        fail("Problem parsing JSON")
                    }
                }
                
                cell = RepositoryTableViewCell(style: .default, reuseIdentifier:
                    "RepositoryTableViewCell")
                cell.nameLabel.text = sut.name
                
            }
            
            it("should not be nil") {
                expect(cell).toNot(beNil())
                
            }
            
            it("should have expected repo name after setup") {
                expect(cell.nameLabel.text).to(equal(sut.name))
            }
            
            it("should trigger fatal error if init with coder") {
                expect { () -> Void in
                    let _ = RepositoryTableViewCell(coder: NSCoder())
                }.to(throwAssertion())
            }
            
        }
    }
}
