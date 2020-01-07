//
//  MovieListView.swift
//  MovieFinder
//
//  Created by João Leite on 07/01/20.
//  Copyright © 2020 João Leite. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    @State var moviesList : [MovieDTO] = []
    @State var currentPage : Int = 1
    
    var body: some View {
        NavigationView {
            List(moviesList) { movie in
                MovieRowView(movie: movie)
                .onAppear {
                    self.getNextPageIfNecessary(lastMovie: movie)
                }
            }
        .navigationBarTitle("Movies")
        }
        
        .onAppear {
            self.downloadFirstMovies()
        }
    }
    
    func downloadFirstMovies() {
        guard movieList.isEmpty else { return }
        MovieServices.getMovies(page: currentPage) { (newMovies) in
            self.moviesList.append(contentsOf: newMovies)
        }
    }
    
    func getNextPageIfNecessary(lastMovie : MovieDTO) {
        if let index = moviesList.firstIndex(where: {$0.id == lastMovie.id}) {
            if ((index * 100) / moviesList.count) >= 80 {
                currentPage = currentPage + 1
                MovieServices.getMovies(page: currentPage) { (newMovies) in
                    self.moviesList.append(contentsOf: newMovies)
                }
            }
        }
    }
    
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
