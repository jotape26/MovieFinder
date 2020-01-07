//
//  ContentView.swift
//  MovieFinder
//
//  Created by João Leite on 07/01/20.
//  Copyright © 2020 João Leite. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var moviesList : [MovieDTO] = []
    @State var currentPage : Int = 1
    
    func getNextPageIfNecessary(lastMovie : MovieDTO) {
        if let index = moviesList.firstIndex(where: {$0.id == lastMovie.id}) {
            if index > (index / 2) {
                currentPage = currentPage + 1
                MovieServices.getMovies(page: currentPage) { (newMovies) in
                    self.moviesList.append(contentsOf: newMovies)
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            HStack {
                ZStack {
                    Image(systemName: "star.fill")
                    .resizable()
                        .foregroundColor(Color.yellow)
                        .frame(width: CGFloat(40.0), height: CGFloat(40.0))
                    
                    Text("7.7")
                        .foregroundColor(.white)
                        .bold().font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/).offset(x: 0, y: 3)
                }
                
                Text("/ 10")
                .navigationBarTitle("Movies")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
