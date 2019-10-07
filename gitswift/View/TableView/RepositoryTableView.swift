//
//  RepositoryTableView.swift
//  gitswift
//
//  Created by Rodrigo Andrade on 06/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import Foundation
import UIKit

class RepositoryTableView: UIView, CodeView {
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
         setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lazy Properties
    
    lazy var tableView: UITableView = {
         let tableView = UITableView(frame: .zero, style: .plain)
         tableView.backgroundColor = .white
         return tableView
     }()

    // MARK: - Public Methods
      
    func buildHierarchy() {
         self.addSubview(tableView)
    }
    
    func buildConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
