//
//  RepositoryViewControllerSpecs.swift
//  gitswiftTests
//
//  Created by Rodrigo Andrade on 07/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import Quick
import Nimble
@testable import gitswift

class RepositoryViewControllerSpecs: QuickSpec {
    
    override func spec() {
        describe("a repository view controller") {
            var controller = RepositoryViewController()
            
            beforeEach {
                let window = UIWindow(frame: UIScreen.main.bounds)
                let repositoryViewController = RepositoryViewController()
                window.makeKeyAndVisible()
                controller = repositoryViewController
                window.rootViewController = repositoryViewController
                controller.loadView()
                
            }
            
            it("should be able to create a controller") {
                expect(controller).toNot(beNil())
            }
            
            it("should be able to init a tableView") {
                expect { () -> Void in
                    let _ = RepositoryTableView(coder: NSCoder())
                }.to(throwAssertion())
            }
            
            it("should have the expected navigation bar") {
                controller.viewDidLoad()
                expect(controller.navigationItem).toNot(beNil())
            }
            
            it("should fetch more"){
                controller.fetchMore {
                    
                }
            }
            
            it("should reload data") {
                expect(controller.refreshData()).toNot(throwAssertion())
            }
            
            it("should trigger fatal error if init with coder") {
                expect { () -> Void in
                    let _ = RepositoryViewController(coder: NSCoder())
                }.to(throwAssertion())
            }
            
        }
    }
}
