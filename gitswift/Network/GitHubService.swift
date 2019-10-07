//
//  GitHubService.swift
//  gitswift
//
//  Created by Rodrigo Andrade on 06/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import CodableAlamofire
import Alamofire

class GitHubService: NSObject  {
    
    private let baseApiUrl = "https://api.github.com"
    
    func fetch(page: Int, completion: @escaping ((RepositoriesResponse)) -> Void) {
        
        guard let url = URL(string: "\(baseApiUrl)/search/repositories?q=language:swift&sort=stars&per_page=50") else { return }
        
        let params = ["page": page]
    
        Alamofire.request(url, parameters: params).responseDecodableObject(decoder: JSONDecoder()) {(response: DataResponse<RepositoriesResponse>) in
            switch response.result {
            case .success:
                if let response = response.result.value {
                
                    completion(response)
                }
                
            case .failure:
                print("Error to get repositories")
            
            }
        }
    }
}
