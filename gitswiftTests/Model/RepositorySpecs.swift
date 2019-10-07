//
//  RepositorySpec.swift
//  gitswiftTests
//
//  Created by Rodrigo Andrade on 07/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import Quick
import Nimble

@testable import gitswift

class RepositorySpecs: QuickSpec {
    override func spec() {
        var sut: RepositoriesResponse!
        describe("a 'Repository'") {
            context("Can be created with valid JSON") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    if let path = Bundle(for: type(of: self)
                    ).path(forResource: "repositories", ofType: "json") {
                        do {
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            sut = try decoder.decode(RepositoriesResponse.self, from: data)
                        } catch {
                            fail("Problem parsing JSON")
                        }
                    }
                }
                it("should be able to create a repository from json") {
                    expect(sut.items).toNot(beNil())
                }
                
                it("should have a description") {
                    expect(sut.items?.first?.description).toNot(beNil())
                }
            }
        }
    }
}
