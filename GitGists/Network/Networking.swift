//
//  Networking.swift
//  GitGistss
//
//  Created by Miska  on 19/12/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation

class Networking {
    func request(urlString: String, completion: @escaping(Result<Data,Error>)->Void){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error{
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                completion(.success(data))
            }
        }.resume()
    }
    
}
