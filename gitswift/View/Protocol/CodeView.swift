//
//  CodeView.swift
//  gitswift
//
//  Created by Rodrigo Andrade on 06/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import Foundation

protocol CodeView {
    func buildHierarchy()
    func buildConstraints()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildHierarchy()
        buildConstraints()
    }
}
