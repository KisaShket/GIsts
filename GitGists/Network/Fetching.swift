//
//  Fetching.swift
//  GitGistss
//
//  Created by Miska  on 19/12/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation

class Fetching{
    
    let networkService = Networking()
    var isFetchinNow:Bool = false
    func fetch(urlString:String, response: @escaping ([GistModel]?)->Void){
        guard !isFetchinNow else {
            return
        }
        isFetchinNow = true
        networkService.request(urlString: urlString) { (result) in
            switch result{
            case .success(let data):
                do{
                    let gists = try JSONDecoder().decode([GistModel].self, from: data)
                    response(gists)
                    self.isFetchinNow = false
                    print("Fetched")
                }catch let jsonError{
                    print("Decode failed:", jsonError.localizedDescription)
                    response(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.isFetchinNow = false
            }
        }
    }
}
