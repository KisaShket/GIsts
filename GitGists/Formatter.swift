//
//  Formatter.swift
//  GitGists
//
//  Created by Miska  on 21/12/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation

class Formatter{
    let formatterGet = DateFormatter()
    let formatterPrint = DateFormatter()
    func formatDate(date:String)->String{
        formatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = formatterGet.date(from: date)
        formatterPrint.dateFormat = "E, d MMM yyyy HH:mm:ss"
        return formatterPrint.string(from: date!)
    }
    
    func nilOrNah(description: String?)->String{
        if description == nil || description == ""{
            return "No Description"
        }
        return description!
    }
}
