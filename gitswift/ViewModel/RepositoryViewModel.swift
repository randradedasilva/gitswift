//
//  RepositoryViewModel.swift
//  gitswift
//
//  Created by Rodrigo Andrade on 06/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import Alamofire

class RepositoryViewModel: NSObject {
    
    // MARK: - Public Properties
    
    var navigationTitle: String {
        return "Repositories"
    }
    
    var didCompleteFetch: (() -> ())?
    
    // MARK: - Private Properties
    
    private var request = GitHubService()
    private(set) var isLoading: Bool = false
    
    // MARK: - Public Properties
    
     var repository: [Repository] = [] {
        didSet {
            self.didCompleteFetch?()
        }
    }
    
    // MARK: - Public Methods
    
    func fetchRepositories(page: Int) {
        self.isLoading = true
        request.fetch(page: page) { (response) in
            if let repositories = response.items {
                if page > 1 {
                    
                    self.repository.append(contentsOf: repositories)
                    
                } else {
                    
                    self.repository = repositories
                }
                self.isLoading = false
            }
        }
    }
    
    func getRepositoryCell(at indexPath: IndexPath) -> RepositoryCellViewModel {
        let repositoryModel = self.repository[indexPath.row]
        
        return RepositoryCellViewModel(description: repositoryModel.description, name: repositoryModel.name, starsCount: String(repositoryModel.stargazers_count ?? 0), owner: repositoryModel.owner)
    }
    
    func numberOfSections() -> Int {
        
        return 1
    }
    
    func numberOfRows() -> Int {
        return self.repository.count
    }
    
    func cellForRow(at indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: RepositoryTableViewCell.self)
        cell.configure(with: getRepositoryCell(at: indexPath))
        cell.layoutIfNeeded()
        cell.selectionStyle = .none
        return cell
    
    }
}
