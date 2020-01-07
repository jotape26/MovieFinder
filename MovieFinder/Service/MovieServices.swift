//
//  MovieServices.swift
//  MovieFinder
//
//  Created by João Leite on 07/01/20.
//  Copyright © 2020 João Leite. All rights reserved.
//

import Foundation

class MovieServices {
    
    static var BASE_URL : String = "https://api.themoviedb.org/3/"
    static var IMAGE_URL : String = "https://image.tmdb.org/t/p/w500"
    
    static var BEARER_TOKEN : String = ""
    
    static func getMovies(page: Int,
                          success: @escaping([MovieDTO])->()) {
        
        var request = URLRequest(url: URL(string: MovieServices.BASE_URL + "movie/popular?page=\(page.description)")!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(MovieServices.BEARER_TOKEN)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
            
                do {
                    let jsonObj = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let results = jsonObj["results"] as! [[String : Any]]
                    
                    var movies : [MovieDTO] = []
                    results.forEach { resultObj in
                        movies.append(MovieDTO(json: resultObj))
                    }
                    
                    success(movies)
                } catch {
                    
                }
            } else {
                print(error.debugDescription)
            }
            
            
        }.resume()
        
    }
}
