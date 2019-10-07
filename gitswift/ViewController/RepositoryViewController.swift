//
//  RepositoryViewController.swift
//  gitswift
//
//  Created by Rodrigo Andrade on 06/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import UIKit
import Reusable

class RepositoryViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let refreshControl = UIRefreshControl()
    private var viewModel =  RepositoryViewModel()
    private var page = 1
    private var repositoryTableView = RepositoryTableView()
    private let activityIndicatorView = UIActivityIndicatorView(style: .gray)
    
    // MARK: - Inits
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
        setupRefreshControl()
    }
    
    override func loadView() {
        super.loadView()
        self.view = repositoryTableView
       
    }
    
    func setupView() {
        self.navigationController?.topViewController?.title = viewModel.navigationTitle
        self.activityIndicatorView.color = .black
        activityIndicatorView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: repositoryTableView.tableView.bounds.width, height: CGFloat(44))
        self.repositoryTableView.tableView.tableFooterView = self.activityIndicatorView
        self.repositoryTableView.tableView.register(cellType: RepositoryTableViewCell.self)
        self.repositoryTableView.tableView.rowHeight = UITableView.automaticDimension
        self.repositoryTableView.tableView.delegate = self
        self.repositoryTableView.tableView.dataSource = self
        
    }
    
    func setupViewModel() {
        activityIndicatorView.startAnimating()
        viewModel.didCompleteFetch = {
            self.reloadDataAsync()
           self.activityIndicatorView.stopAnimating()
        }
        viewModel.fetchRepositories(page: page)
        
    }
    
    func setupRefreshControl() {
        self.repositoryTableView.tableView.addSubview(refreshControl)
        self.refreshControl.tintColor = .black
        self.refreshControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        
    }
    
    // MARK: - Public Methods
    
    func fetchMore(completion: @escaping () -> Void) {
        viewModel.fetchRepositories(page: page)
        reloadDataAsync()
        completion()
        
    }
    
    @objc func refreshData() {
        self.page = 1
        self.fetchMore {
            self.refreshControl.endRefreshing()
        }
    }
    
    func reloadDataAsync() {
        DispatchQueue.main.async {
            self.repositoryTableView.tableView.reloadData()
        }
    }
}

    // MARK: - UITableViewDataSource

extension RepositoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.viewModel.cellForRow(at: indexPath, from: tableView)
    }
}

    // MARK: - UITableViewDelegate

extension RepositoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = tableView.numberOfRows(inSection: indexPath.section) - 1
        
        if lastRowIndex == indexPath.row &&
            !self.viewModel.isLoading {
            self.page += 1
            self.activityIndicatorView.startAnimating()
            self.fetchMore {
                self.repositoryTableView.tableView.tableFooterView?.isHidden = false
            }
        }
    }
}
