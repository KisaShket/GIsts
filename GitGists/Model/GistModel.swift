//
//  GistModel.swift
//  GitGists
//
//  Created by Miska  on 20/12/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation

struct GistModel:Decodable {
    var description:String?
    var created_at:String?
    var updated_at:String?
    var html_url:String?
}



