//
//  MovieDTO.swift
//  MovieFinder
//
//  Created by João Leite on 07/01/20.
//  Copyright © 2020 João Leite. All rights reserved.
//

import UIKit

class MovieDTO: Identifiable {
    var id           : Int
    var title        : String
    var overview     : String
    var release_date : String
    var adult        : Bool
    var posterPath   : String
    var votes        : Double
    
    init(json: [String : Any]) {
        self.id = (json["id"] as? Int) ?? 0
        self.title = (json["title"] as? String) ?? ""
        self.overview = (json["overview"] as? String) ?? ""
        self.release_date = (json["release_date"] as? String) ?? ""
        self.adult = (json["adult"] as? Bool) ?? false
        
        self.posterPath = MovieServices.IMAGE_URL + ((json["poster_path"] as? String) ?? "")
        self.votes = (json["vote_average"] as? Double) ?? 0.0
    }
}
